<?php

namespace app\index\controller;


use app\common\controller\Frontend;
use app\index\model\Fans;
use app\index\model\Mail;
use think\Request;
use app\index\model\Sms;
use app\index\model\Shop;
use app\index\model\Data;
use app\index\model\User as User;
use app\index\model\Video;
use app\index\model\Agent as Agent_T;
use app\index\model\Order;
use app\index\model\Money;
use app\index\model\Footprint;
use think\Cookie;
use think\Session;
use Jenssegers\Agent\Agent;
use app\index\controller\User as HumanCheck;

class Member extends Frontend
{

    public function _initialize()
    {
        parent::_initialize();
        // 记录访问信息 和 机器人拦截
        Member::agent();
    }


    public static function agent()
    {
        // 初始化需要获取的值
        // 把需要收集信息随时加入到这个数组里 很方面


        $info = [];


        $agent = new Agent();

        // 语言
        $languages = $agent->languages();
        // ['nl-nl', 'nl', 'en-us', 'en']
        $info['language'] = isset($languages) ? $languages[0] : '';
        // 是否是机器人
        $info['robot'] = $agent->isRobot();
        // 获取设备信息 (iPhone, Nexus, AsusTablet, ...)
        $info['device'] = $agent->device();

        // 浏览器信息  (Chrome, IE, Safari, Firefox, ...)
        $browser         = $agent->browser();
        $info['browser'] = $browser;

        if (!$browser) {
            echo "请使用浏览器访问";
            die;
        }

        // 获取浏览器版本
        $version = $agent->version($browser);
        // 获取系统版本
        $platform         = $agent->platform();
        $info['platform'] = $platform;
        if (!$platform) {
            echo "请问访问操作系统是什么？";
            die;
        }
        $version          = $agent->version($platform);
        $info['platform'] = $info['platform'].$version;

        if ($info['platform']) {
            // 记录访问量
            footprint();
        }
        // 这一句是tp5是任意使用一下session类才可以获取session_id
        // 估计tp5里为了节省资源，默认没有创建session_id
        Session::get('start_session_working');
        $info['session_id'] = session_id();
        // 使用session_id判断唯一用户如果只保存一条session_id记录

        $count = Agent_T::where('session_id', $info['session_id'])->count();
        if ($count) {
            return '';
        }

        /**
         * 以上是agent类提供的
         * 以下补充需要重点加的
         * 1. 产品页面需要带id 页面太多不然都是统计一页
         * 2. 来路统计
         */
        $user_id         = Cookie::get('user_id');
        $info['user_id'] = isset($user_id) ? $user_id : 0;


        $request    = Request::instance();
        $info['ip'] = $request->ip();
        //  模块控制器和方法
        $info['path'] = $request->path();
        $view         = $request->module().$request->controller().$request->action();
        // 如果是产品详情页，记录一下访问的产品id，$goods_id
        if ($view == 'indexIndexview') {
            $info['goods_id'] = input('id');
        }

        if (isset($_SERVER["HTTP_REFERER"])) {
            $domain = "http://".parse_url($_SERVER['HTTP_REFERER'])['host'];
            if ($domain <> $request->domain()) {
                $info['domain']  = parse_url($_SERVER['HTTP_REFERER'])['host'];
                $info['referer'] = $_SERVER['HTTP_REFERER'];
            }
        }


        $user = new Agent_T();
        $user->data($info);
        $user->save();


        // if ($user->id) {
        //     // 验证真人
        //     $human = new HumanCheck();
        //     $human->human($info['ip']);
        // }
    }

    public function skin()
    {
        /**
         * 开发皮肤模板
         * 老看一个配色方案感觉审美疲劳
         * 但是又不能影响基本的配色方案
         * 所以开发一个自定义的配色方案，默认的不换，但是可以选择换风格
         * 实现思路
         * 头部调用一个动态地址的css样式文件，实现不同几个风格的选择
         * 前台用户选择了某个风格后，后台数据库记录一下
         * 前台显示这个css的时候，先去查查这个用户对应的风格的css文件
         * 实际开发流程
         * 1.head里加个cookie获取
         * 2.会员登录里一起读取skin的数值
         */
        $param   = input('param');
        $user_id = Cookie::get('user_id');

        // 有效期十年
        Cookie::set('skin', $param, 315360000);

        // 如果登录了可以记录下载
        // 保存用户表里通过用户登录的时候加载
        if ($user_id) {
            // 代码略
        }
        //重定向 不用提示
        return $this->redirect('index/index/index');

        // 提示
        // return $this->success('设置成功^_^', 'index/index', 0);
    }

    public function myhome()
    {
        $user_id = Cookie::get("user_id");
        if (!$user_id) {
            # 没有登录 跳转到登录页面
            return $this->redirect('index/index/login');
        }

        // 是否为 POST 请求
        if (request()->isPost()) {

            $add = Data::add();


            if ($add) {
                // $this->redirect('index/member/myhome');
                //设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
                $this->success('发布成功');
            } else {
                //错误页面的默认跳转页面是返回前一页，通常不需要设置
                $this->error('请填写内容');
            }
        }


        // 查询指定用户信息
        $usert = User::userselfinfo(Cookie::get('user_id'));


        // 查询最新的聊天信息
        $data = Data::jack();


        $this->assign('usert', $usert);
        $this->assign('data', $data);


        return view();
    }

    public function start()
    {
        $user = Cookie::get('phone');


        // ajax 签到调用

        if (request()->isPost()) {
            $user             = Cookie::get('phone');
            $registration_vip = input('registration_vip');

            if (!$user) {
                return "大佬！请登录";
                # 没有登录 跳转到登录页面
                // redirect('index / index / login')->remember();

            }

            // 判断今天是否有签到记录
            $registration_user = Order::where('phone', '=', $user)
                ->where('body', '=', 135)
                ->whereTime('create_time', 'today')
                ->count();


            // 如果是自动签到 已经签到成功不在返回提示
            if ($registration_vip and $registration_user) {
                return 0;
                die();
            }


            // 检查昨天是否签到
            $rand = Order::where('body', 135)
                ->where('phone', $user)
                ->whereTime('create_time', 'yesterday')
                ->value('rand');

            $rand = $rand + 1;


            if ($registration_user) {
                # 已经签到直接提示
                return "已连续签到".$rand."天";
            }


            // 生成签到记录订单
            $user = Order::create(
                [
                    'body'         => 135,
                    'subject'      => "签到",
                    'total_amount' => 0,
                    'rand'         => $rand,
                    'phone'        => $user
                ]
            );


            // 设置对应奖励的vip天数


            if ($rand == 3) {
                $add_vip_days = 1;
            } elseif ($rand == 8) {
                $add_vip_days = 3;
            } elseif ($rand == 16) {
                $add_vip_days = 6;
            } elseif ($rand == 32) {
                $add_vip_days = 18;
            } elseif ($rand > 32) {
                $add_vip_days = 1;
            } else {
                $add_vip_days = 0;
            }


            // 判断今天是否领取奖励
            $rand_today = Order::where('body', 135)
                ->where('phone', $user)
                ->where('out_trade_no', '135001')
                ->whereTime('create_time', 'today')
                ->count();


            // 如果有奖励，执行奖励vip天数的公用功能
            if ($add_vip_days >= 1 and $rand_today <= 0) {
                add_vip_days($add_vip_days, 135001);
            }


            return "恭喜您，连续签到".$rand."天";
        }


        //        查询今天签到
        $list = Order::where('body', '=', 135)
            ->whereTime('create_time', 'today')
            ->where('phone', '=', $user)
            ->paginate(100);

        //        查询昨天签到
        $yesterday = Order::where('body', '=', 135)
            ->whereTime('create_time', 'yesterday')
            ->where('phone', '=', $user)
            ->paginate(100);


        //        查询前天签到
        $the_day_before_yesterday = Order::where('body', '=', 135)
            ->whereTime('create_time', ' - 7 day')
            ->where('phone', '=', $user)
            ->paginate(100);

        //        查询最近7天签到
        $list_all = Order::where('body', '=', 135)
            ->where('phone', '=', $user)
            ->whereTime('create_time', ' - 7 day')
            ->paginate(100);


        // 创建一个45天的数组
        $cars = array("Volvo", "BMW", "Toyota");
        // echo  $cars[0] .   $cars[1] .   $cars[2]  ;

        // $cars[3]=8;


        for ($i = 0; $i < 45; $i++) {
            # code...
            $cars[$i] = $i;
        }

        // dump($cars);


        // 二维数组：
        // $cars=array
        //   (
        //   array("Volvo",100,96),
        //   array("BMW",60,59),
        //   array("Toyota",110,100)
        //   );
        //  dump($cars);

        // die();


        // 第一天是他签到开始的第一天

        // 获取签到开始的第一天


        $firstday = '2018 - 7 - 29';


        $allstart = 0;


        for ($i = 1; $i < 46; $i++) {
            # code...

            echo "45天-之第".$i."天 ";


            // echo $firstday. "签到情况 ";

            $day_a = $firstday.' 00:00:00';
            $day_b = $firstday.' 23:59:59';


            $everyday = Order::where('body', '=', 135)
                ->where('phone', '=', $user)
                ->where('create_time', 'between time', [$day_a, $day_b])
                ->order('id asc')
                ->count();


            // 设置对应45个session的方式，方便模板里调用。

            session('s_'.$i, $everyday);
            echo 'session里的结果'.session('s_'.$i);

            if ($everyday) {
                # code...
                // echo " 今天签到了，点亮   获得一课星星  ☆   <br> ";
                $allstart++;
            } else {
                // echo " 熄灭代码 <br>";
            }
            echo "<br >";

            // 下一天 date('Y - m - d',strtotime($date.' - 1 day'))
            // $firstday=$firstday +1;
            $firstday = date('Y - m - d', strtotime($firstday.' + 1 day'));
        }


        echo "您总共获得星星".$allstart;


        //       连续签到排名
        $list_top = Order::where('body', '=', 135)
            ->where('phone', '=', $user)
            ->order('id desc')
            ->paginate(50);


        $this->assign('list', $list);
        $this->assign('list_all', $list_all);
        $this->assign('list_top', $list_top);
        $this->assign('yesterday', $yesterday);

        return view();
    }


    public function news()
    {
        // 获取需要查询的某个用户的动态
        $user_id = input('user_id');


        // 设置默认查询参数，没有用户查到用户就不查询
        $phone = 0;
        $eq    = "<>";

        // $phone       =input('phone');

        // 通过用户id查询出来手机号，如果有user_id字段这个地方就可以省略了
        # code...


        // $phone="18210787405";

        if ($phone) {
            # 设置打开单用户搜索功能
            $eq = "=";
        }


        //  在线时间排名
        $online_time = User::where('phone', '<>', '15966982315')
            ->where('phone', '=', $phone)
            ->order('online_time desc')
            ->where('phone', $eq, $phone)
            ->limit(10)
            ->select();


        //  学习最新动态 

        $leraning_time = Video::order('update_time desc')
            ->where('phone', $eq, $phone)
            ->limit(10)
            ->select();


        //  金币排行榜
        $money = Money::where('phone', '<>', '15966982315')
            ->where('phone', '<>', '0')
            ->field('id,phone,content, money,create_time')
            ->order('id desc')
            ->where('phone', $eq, $phone)
            ->limit(10)
            ->select();

        //  积分排行榜 
        $money_add = Money::where('phone', '<>', '15966982315')
            ->where('phone', '<>', '0')
            ->where('money', '<>', '0')
            ->where('phone', $eq, $phone)
            ->field('id,phone, money,create_time')
            ->order('id desc')
            ->limit(10)
            ->select();


        //  最新上课
        $pathinfo = Footprint::field('id,phone,create_time,pathinfo')
            ->order('id desc')
            ->where('phone', $eq, $phone)
            ->where('pathinfo', 'like', '%'.'index / index / view'.'%')
            ->limit(10)
            // ->fetchSql(true)
            ->select();

        //  最新搜索
        $search = Footprint::field('id,url,create_time')
            ->order('id desc')
            ->where('phone', $eq, $phone)
            ->where('pathinfo', '=', 'index / index / like')
            ->limit(10)
            // ->fetchSql(true)
            ->select();


        //  最新来路 
        $domain = Footprint::
        field('id,phone,referer as domain,create_time')
            ->order('id desc')
            // ->where('pathinfo','like','%'.'index / index / view'.'%')
            // ->where('domain','like','%'.'com'.'%')
            ->where('domain', '<>', 'open . gaoxueya . com')
            ->where('domain', '<>', 'www . tp5 . com')
            ->where('phone', $eq, $phone)
            ->where('domain', '<>', '')
            ->where('domain', '<>', 'blank')
            ->limit(10)
            ->select();


        //  最新访问动态 
        $footprint_phone = Footprint::
        field('id,phone,pathinfo,create_time')
            ->where('phone', $eq, $phone)
            ->order('id desc')
            ->where('phone', '<>', '15966982315')
            ->where('pathinfo', '<>', 'index / member / news')
            ->limit(10)
            ->select();


        //  最新发送短信sms
        $sms = Sms::field('id,phone,create_time')
            ->where('phone', $eq, $phone)
            ->order('id desc')
            ->limit(10)
            ->select();

        //  最新订单
        $total_amount = Order::
        field('id,phone,body,total_amount,subject,create_time')
            ->where('phone', '<>', '15966982315')
            ->where('phone', $eq, $phone)
            // ->whereTime('create_time', 'today')
            ->order('id desc')
            ->limit(10)
            ->select();


        //  最新签到
        $registration = Order::where('body', '=', 135)
//            ->group('phone')
            ->field('id,phone,create_time')
            ->where('phone', $eq, $phone)
            ->order('id desc')
            ->where('phone', '<>', '15966982315')
            ->limit(10)
            ->select();


        //  最新留言
        $new_message = Data::field('id,title,phone,create_time')
            ->where('phone', $eq, $phone)
            ->order('id desc')
            ->limit(10)
            ->select();


        // $this->assign('list',$list);
        $this->assign('leraning_time', $leraning_time);
        $this->assign('sms', $sms);
        $this->assign('online_time', $online_time);
        $this->assign('pathinfo', $pathinfo);
        $this->assign('domain', $domain);
        $this->assign('money', $money);
        $this->assign('search', $search);
        $this->assign('total_amount', $total_amount);
        $this->assign('new_message', $new_message);
        $this->assign('money_add', $money_add);
        $this->assign('footprint_phone', $footprint_phone);
        $this->assign('registration', $registration);

        return view();
    }


    public function follow()
    {
        $this->must_log_in();

        // 获取来路页面 redis  SWOOLE
        $follow_id = input('follow_id');

        $user_id = Cookie::get('user_id');


        // 添加关注
        if (input('editfollow') == 1) {
            if ($user_id == $follow_id) {
                $this->error("不能自己关注自己");
            }

            $fanscount = Fans::where('user_id', Cookie::get('user_id'))
                ->where('follow_id', $follow_id)
                ->count();


            if (!$fanscount) {
                // 添加关注
                $user            = new Fans;
                $user->user_id   = Cookie::get('user_id');
                $user->follow_id = $follow_id;
                $user->save();
            }
        }
        // 取消关注
        if (input('editfollow') == 2) {
            // 删除状态为0的数据
            Fans::destroy(['user_id' => Cookie::get('user_id'), 'follow_id' => $follow_id], true);
        }

        $this->redirect('index/member/home', ['user_id' => $follow_id]);
    }

    public function home()
    {
        // 是否为 POST 请求
        if (request()->isPost()) {
            $this->must_log_in();

            $to = input('to');
            $title = trim(input('title'));

            // 发私信功能
            if ($to and $title) {


                $data = Mail::send();


                if ($data) {
                    // $this->redirect();
                    //设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
                    $this->success('发布成功');
                } else {
                    //错误页面的默认跳转页面是返回前一页，通常不需要设置
                    $this->error('请填写内容');
                }
            }

            $add = Data::add();

            if ($add) {
                // $this->redirect();
                //设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
                $this->success('发布成功');
            } else {
                //错误页面的默认跳转页面是返回前一页，通常不需要设置
                $this->error('请填写内容');
            }
        }

        // 直接调用统一的自定义方法 查询指定用户信息
        $user = User::userselfinfo(input('user_id', 393));

        // 查询最新的聊天信息
        $data = Data::jack(input('user_id'));

        $this->assign('user', $user);
        $this->assign('data', $data);


        return view();
    }


    public function tip()
    {
        // 预约课程
        $appointment = input('appointment');

        Session::set('return_url', 'index/member/tip');

        //  打赏列表
        $list = Order::where('type', '=', 37)
            ->where('status', 1)
            ->field('id,user_id, total_amount,create_time,subject')
            ->order('id desc')
            ->paginate(15);


        //  打赏排名
        $total_amount = Order::where('type', '=', 37)
            ->where('status', 1)
            ->group('user_id')
            ->field('id,user_id, sum(`total_amount`) as total_amountcount,create_time,subject')
            ->order('total_amountcount desc')
            ->limit(10)
            ->select();


        //  打赏总金额
        $total_amount_count = Order::where('type', '=', 37)
            ->where('status', 1)
            ->sum('total_amount');


        $this->assign('total_amount', $total_amount);
        $this->assign('total_amount_count', $total_amount_count);
        $this->assign('list', $list);

        if ($appointment) {
            # code...
            return view('appointment');
        }


        return view();
    }

    public function tips()
    {
        //  打赏列表
        $list = Order::where('type', '=', 37)
            ->field('id,phone, total_amount,create_time,subject')
            ->where('phone', '<>', '15966982315')
            ->order('id desc')
            ->paginate(15);


        //  打赏排名
        $total_amount = Order::where('type', '=', 37)
            ->group('phone')
            ->field('id,phone, sum(`total_amount`) as total_amountcount,create_time,subject')
            ->where('phone', '<>', '15966982315')
            // ->whereTime('create_time', 'today')
            ->order('total_amountcount desc')
            ->limit(10)
            ->select();


        //  打赏总金额
        $total_amount_count = Order::where('type', '=', 37)
            // ->field('total_amount')
            // ->where('phone','<>','15966982315')
            ->sum('total_amount');


        $this->assign('total_amount', $total_amount);
        $this->assign('total_amount_count', $total_amount_count);
        $this->assign('list', $list);


        return view();
    }

    public function top()
    {
        // 设置缓存数据
        // cache('show', $show, 300);

        // dump(cache('date'));

        // ajax异步更新缓存 通过清空缓存激活的方式
        // 少嵌套if是代码更加简洁
        if (request()->isPost()) {
            cache('online_time', null);
        }

        if (!cache('online_time')) {
            # code...
            $cach_time = 0;

            dump("没有用缓存".$cach_time);

            // 设置缓存数据
            // cache('date',  date('y - m - d h:i:s',time()), $cach_time);
            // dump(cache('date'));


            //  在线时间排名
            $online_time = User::where('phone', 'NEQ', '15966982315')
                ->order('online_time desc')
                ->limit(10)
                ->select();
            cache('online_time', $online_time, $cach_time);


            //  学习时长排行榜
            $leraning_time = Video::group('phone')
                // ->field('phone,sum(title)')
                ->field('id,phone, sum(`title`) as title')
                ->order('title desc')
                ->limit(10)
                ->select();
            cache('leraning_time', $leraning_time, $cach_time);

            //  金币排行榜
            $money = Money::group('phone')
                ->where('phone', '<>', '15966982315')
                ->where('phone', '<>', '0')
                ->field('id,phone, sum(`money`) as money')
                ->order('money desc')
                ->limit(10)
                ->select();
            cache('money', $money, $cach_time);

            //  积分排行榜
            $money_add = Money::group('phone')
                ->where('phone', '<>', '15966982315')
                ->where('phone', '<>', '0')
                ->where('money', '<>', '0')
                ->field('id,phone, sum(`money`) as money')
                ->order('money desc')
                ->limit(10)
                ->select();
            cache('money_add', $money_add, $cach_time);


            //  课程学习次数排行榜
            $pathinfo = Footprint::group('pathinfo')
                ->field('id,phone, count(`pathinfo`) as pathinfocount,Now(),pathinfo')
                ->order('pathinfocount desc')
                ->where('pathinfo', 'like', '%'.'index / index / view'.'%')
                ->limit(10)
                // ->fetchSql(true)
                ->select();
            cache('pathinfo', $pathinfo, $cach_time);


            //  搜索排行榜
            $search = Footprint::group('url')
                ->field('id,count(`url`) as urlcount,url')
                ->order('urlcount desc')
                ->where('pathinfo', '=', 'index / index / like')
                ->limit(10)
                ->select();
            cache('search', $search, $cach_time);
            // dump($search); die();


            //  来路域名榜
            $domain = Footprint::group('domain')
                ->field('id,phone, count(`domain`) as domaincount,domain')
                ->order('domaincount desc')
                // ->where('pathinfo','like','%'.'index / index / view'.'%')
                ->where('domain', 'like', '%'.'com'.'%')
                ->limit(10)
                ->select();
            cache('domain', $domain, $cach_time);


            //  访问次数榜
            $footprint_phone = Footprint::group('phone')
                ->field('id,phone, count(`phone`) as phonecount')
                ->order('phonecount desc')
                ->where('phone', '<>', '15966982315')
                ->limit(10)
                ->select();
            cache('footprint_phone', $footprint_phone, $cach_time);


            //  连续签到排名
            $list_top = Order::where('body', '=', 135)
                ->where('phone', '<>', '15966982315')
                ->whereTime('create_time', 'today')
                ->order('rand desc')
                ->limit(10)
                ->select();
            cache('list_top', $list_top, $cach_time);

            //  打赏排名
            $total_amount = Order::where('type', '=', 37)
                ->group('phone')
                ->field('id,phone, sum(`total_amount`) as total_amountcount')
                ->where('phone', '<>', '15966982315')
                // ->whereTime('create_time', 'today')
                ->order('total_amountcount desc')
                ->limit(10)
                ->select();
            cache('total_amount', $total_amount, $cach_time);


            //  访问次数榜
            $registration = Order::where('body', '=', 135)
                ->group('phone')
                ->field('id,phone, count(`phone`) as phonecount')
                ->order('phonecount desc')
                ->where('phone', '<>', '15966982315')
                ->limit(10)
                ->select();
            cache('registration', $registration, $cach_time);


            //  邀请注册榜
            $invite = User::with('sort')
                ->group('invite')
                ->field('id,invite, count(`invite`) as invitecount,phone')
                ->order('invitecount desc')
                ->where('invite', '<>', '0')
                ->limit(10)
                ->select();
            cache('invite', $invite, $cach_time);
        }

        // $this->assign('list',$list);
        $this->assign('leraning_time', cache('leraning_time'));
        $this->assign('list_top', cache('list_top'));
        $this->assign('online_time', cache('online_time'));
        $this->assign('pathinfo', cache('pathinfo'));
        $this->assign('domain', cache('domain'));
        $this->assign('search', cache('search'));
        $this->assign('money', cache('money'));
        $this->assign('total_amount', cache('total_amount'));
        $this->assign('invite', cache('invite'));
        $this->assign('money_add', cache('money_add'));
        $this->assign('footprint_phone', cache('footprint_phone'));
        $this->assign('registration', cache('registration'));

        return view();
        // 排行榜页面

    }

    public function ajaxModelPay()
    {
        // 价格 total_amount
// 主题描述 subject
// 产品id body
// 唯一订单号 trade_no


        $body         = input('body');
        $total_amount = input('total_amount');
        $subject      = input('subject');
        $trade_no     = input('trade_no');
        $phone        = Cookie::get('phone');
        $admin        = Cookie::get('admin');

        if ($admin >= 1) {
//            开发人员测试用
            dump('价格'.$total_amount);
            dump('主题'.$subject);
            dump('产品id'.$body);
            dump('订单号'.$trade_no);
            dump($phone);
        }


        $this->assign('total_amount', $total_amount);
        $this->assign('subject', $subject);
        $this->assign('body', $body);
        $this->assign('trade_no', $trade_no);


        return view();
    }

    public function payReturn()
    {
//        验证时否有支付的Session
//        注意处理完订单后把total_amount的Session设置为0，关闭订单入库
        if (Session::get('total_amount') <= 0) {
            dump(Session::get('total_amount'));
            return "1";
            die();
        } else {
        }


        $phone        = Session::get('phone');
        $body         = Session::get('body');
        $rand         = Session::get('rand');
        $subject      = Session::get('subject');
        $total_amount = Session::get('total_amount');
        $buyer_id     = Session::get('buyer_id');
        $buyer_email  = Session::get('buyer_email');
        $total_amount = Session::get('total_amount');
        $out_trade_no = Session::get('out_trade_no');
        $add_vip_days = '';


        // 处理没有登录先付款的情况
        if (!$phone) {
            $phone = '15966982315';
        }
        // 查询价格是否篡改,大于等于的情况可以通过

        $map['id'] = $body;

        $price = Shop::where($map)
            ->value('price');
        if ($total_amount >= $price) {
        } else {
            $body = 40;
        }


        // 如果是签到，查询昨天累加的签到天数
        if ($body == 135) {
            // 判断今天是否有签到记录
            $rand_today = Order::where('body', $body)
                ->where('phone', '<>', '15966982315')
                ->whereTime('create_time', 'today')
                ->count();


            // 如果前10名，执行奖励vip天数的公用功能
            if ($rand_today <= 10) {
                // add_vip_days(1,135002);
            }

            $rand = Order::where('body', $body)
                ->where('phone', $phone)
                ->whereTime('create_time', 'yesterday')
                ->value('rand');

            $rand = $rand + 1;


            // 设置对应奖励的vip天数


            if ($rand == 3) {
                $add_vip_days = 1;
            } elseif ($rand == 8) {
                $add_vip_days = 3;
            } elseif ($rand == 16) {
                $add_vip_days = 6;
            } elseif ($rand == 32) {
                $add_vip_days = 18;
            } elseif ($rand > 32) {
                $add_vip_days = 1;
            } else {
                $add_vip_days = '';
            }


            // 判断今天是否领取奖励
            $rand_today = Order::where('body', $body)
                ->where('phone', $phone)
                ->where('out_trade_no', '135001')
                ->whereTime('create_time', 'today')
                ->count();


            // 如果有奖励，执行奖励vip天数的公用功能
            if ($add_vip_days >= 1 and $rand_today <= 0) {
                add_vip_days($add_vip_days, 135001);
            }
        }


        // 公共的订单创建语句

        $order = Order::create(
            [
                'phone'        => $phone,
                'body'         => $body,
                'rand'         => $rand,
                'subject'      => $subject,
                'total_amount' => $total_amount,
                'buyer_id'     => $buyer_id,
                'buyer_email'  => $buyer_email,
                'out_trade_no' => $out_trade_no,
            ]
        );


        // 如果是vip用户，设置vip字段
        if ($body == 105) {
            // 设置对应够买的vip会员时间
            if ($total_amount == 9.9) {
                $add_vip_days = 30;
            } elseif ($total_amount == 0.02) {
                $add_vip_days = 1;
            } elseif ($total_amount == 19.9) {
                $add_vip_days = 300;
            } elseif ($total_amount == 99) {
                $add_vip_days = 365;
            } elseif ($total_amount == 399) {
                $add_vip_days = 186;
            } elseif ($total_amount == 699) {
                $add_vip_days = 366;
            }


            add_vip_days($add_vip_days, 135002);


            // User::where('body', $body)
            //     ->update(['rand' => 105]);

            // //设置增加vip天数,先查询vip到期日期
            // $expiration_time =User::where('phone', $phone)
            //     ->whereTime('create_time',' >= ', 'today')
            //     ->value('expiration_time');

//                    设置开始日期，过期的从今天开始算。
            // if ($expiration_time<time()){


            //     $expiration_time=time() ;
            //     $start_time=time() ;

            //     User::where('phone', $phone)
            //         ->update(['start_time' => $start_time,'rand'=> 1]);

            // }
            // 根据支付价格设置对应vip有效期
            // if ($total_amount=33) {
            //     $expiration_time=$expiration_time+ (3600*24*99) ;
            // }elseif ($total_amount=188) {
            //     $expiration_time=$expiration_time+ (3600*24*188) ;
            // }elseif ($total_amount>=320) {
            //     $expiration_time=$expiration_time+ (3600*24*366) ;
            // }else{
            //     $expiration_time=$expiration_time+ (3600*24*32) ;
            // }

            // User::where('phone', $phone)
            //     ->update(['expiration_time' => $expiration_time]);


        }


//        判断是新注册或者重置密码情况
//        注意在重置密码后把total_amount设置为0
//        处理没有登录先付款的情况
//        没有登录订单先临时存入Session中，注册成功后，再回来再次加入订单。

        if ($phone == 15966982315) {
//           重定向方式注册页面，注册/登录后 注意再跳转回次页面进行订单入库

            if ($body == 1008612) {
                //    跳出模态框架
                exit(' < script>top . location . href="../index/login/login/2/" </script > ');

                //           重定向方式
                $this->redirect('index / login', ['login' => '2']);
            }

            //    跳出模态框架,测试模态框内没有获取jq判断，直接跳出到页面外部操作
            exit(' < script>top . location . href="../index/login/" </script > ');

            $this->redirect('index / login', ['login' => '0']);
//            exit(' < script>top . location . href="../index/login/</script>');
//            exit('<script>top.location.href=" ../index / view / id / '.$body.'"</script>');
        }

        //重定向到用户购买的商品结果页面
        // $this->redirect('index/view', ['id' => $body]);


//        设置支付价格为零防止重复订单
        Session::set('total_amount', '0');
        Session::set('body', '');
        Session::set('phone', '15966982315');


//        注册并订单入库后返回到首页
        if ($body == 1008611) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../index / index / login / 221 / '.$body.'"</script>');
        }


//        注册并订单入库后返回到首页
        if ($body == 1008611 or $body == 1008611) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../index / index / login / 221 / '.$body.$phone.'"</script>');
        }


        //        135是签到的，签到后跳转到签到排名
        if ($body == 135) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../member / registration / login / 135 / add_vip_days / '.$rand.'"</script>');
        }


        //        105是开通vip，跳转到vip页面
        if ($body == 105) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../member / vip / add_vip_days / '.$add_vip_days.'"</script>');
        }

        //  37是打赏，打赏后跳转到打赏排名
        if ($body == 37) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../member / tips / login / 23021 / add_vip_days / '.$rand.'"</script>');
        }

        // 如果大于100811的商品上面没有特别指定就跳转到首页 不过这里没给明显的提示
        if ($body >= 1008811) {
            //    跳出模态框架
            exit('<script>top.location.href=" ../index / index / login / 232 / '.$body.'"</script>');
        }


//        重置密码的时候，无论是否登录都跳转到重置密码栏目
//        如果登录状态，订单就入库了，重置密码后跳转到首页
//        如果没登录，重置密码时先做记录，不重置付款状态，跳转回来重新入库。


        exit('<script>top.location.href=" ../index / view / id / '.$body.'"</script>');
    }

    public function footprint_add()
    {
        $data = Cookie::get('footprint');


        // $user=new User;
        // $user->$token;
        // $user->save(); 

        if ($data) {
            // 添加单条数据
            db('footprint')->insert($data);
        }


        Cookie::set('footprint', '', 20);
    }

    public function footprint()
    {
        // 查询会员学习记录
        $list = Footprint::whereTime('create_time', 'today')
            ->where('user_id', '>', 0)
            ->order('id desc,create_time')
            ->paginate(100);


        //        查询新访客学习记录
        $yesterday = Footprint::whereTime('create_time', 'today')
            ->order('create_time desc')
            ->group('ip')
            ->paginate(100);


        //        查询今天明细
        $list_all = Footprint::whereTime('create_time', 'today')
            ->order('create_time desc')
            ->paginate(100);


        $this->assign('list', $list);
        $this->assign('list_all', $list_all);
        $this->assign('yesterday', $yesterday);

        return view();
    }


    public function registration()
    {
        // 签到
        $registration_run = input('registration_run');

        if ($registration_run) {
            $user_id = Cookie::get('user_id');

            if (!$user_id) {
                $this->error('请登录', 'Index/index/login', 'tom', 5);
                return "请登录";
            }

            // 判断今天是否有签到记录
            $registration_user = Order::where('user_id', '=', $user_id)
                ->where('body', '=', 135)
                ->whereTime('create_time', 'today')
                ->count();


            // 检查昨天是否签到
            $rand = Order::where('body', 135)
                ->where('user_id', '=', $user_id)
                ->whereTime('create_time', 'yesterday')
                ->value('rand');

            $rand = $rand + 1;


            if ($registration_user) {
                # 已经签到直接提示
                $msg = "已签到过，加油！已连续签到".$rand."天";
                return $this->success($msg, 'index/member/registration');
                // return "已连续签到" . $rand . "天";
            }


            // 生成签到记录订单
            $user = Order::create(
                [
                    'body'         => 135,
                    'subject'      => "签到",
                    'total_amount' => 0,
                    'rand'         => $rand,
                    'user_id'      => $user_id
                ]
            );


            // 设置对应奖励的vip天数


            if ($rand == 3) {
                $add_vip_days = 1;
            } elseif ($rand == 8) {
                $add_vip_days = 3;
            } elseif ($rand == 16) {
                $add_vip_days = 6;
            } elseif ($rand == 32) {
                $add_vip_days = 18;
            } elseif ($rand > 32) {
                $add_vip_days = 1;
            } else {
                $add_vip_days = 0;
            }


            // 判断今天是否领取奖励
            $rand_today = Order::where('body', 135)
                ->where('user_id', '=', $user_id)
                ->where('out_trade_no', '135001')
                ->whereTime('create_time', 'today')
                ->count();


            // 如果有奖励，执行奖励vip天数的公用功能
            if ($add_vip_days >= 1 and $rand_today <= 0) {
                add_vip_days($add_vip_days, 135001);
            }

            $msg = "恭喜您，连续签到".$rand."天";
            //设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
            return $this->success($msg, 'index/member/registration');
            // return "恭喜您，连续签到" . $rand . "天";

        }


        //        查询今天签到
        $list = Order::where('type', '=', 135)
            ->whereTime('create_time', 'today')
            ->where('status', 1)
            ->order('id', 'asc')
            ->paginate(100);

        //        查询昨天签到
        $yesterday = Order::where('type', '=', 135)
            ->where('status', 1)
            ->whereTime('create_time', 'yesterday')
            ->order('id', 'asc')
            ->paginate(100);


        //        查询前天签到
        $the_day_before_yesterday = Order::where('type', '=', 135)
            ->where('status', 1)
            ->whereTime('create_time', 'between', ['$the_day_before_begin', '$the_day_before_end'])
            ->order('id', 'asc')
            ->paginate(100);

        //        查询最近7天签到
        $list_all = Order::where('type', '=', 135)
            ->where('status', 1)
            ->whereTime('create_time', '-7 day')
            ->order('id', 'asc')
            ->paginate(100);

        //       连续签到排名
        $list_top = Order::where('type', '=', 135)
            ->where('status', 1)
            // ->whereTime('create_time', 'today')
            ->order(['rand' => 'desc', 'id' => 'desc'])
            ->group('user_id')
            ->paginate(50);


        $this->assign('list', $list);
        $this->assign('list_all', $list_all);
        $this->assign('list_top', $list_top);
        $this->assign('yesterday', $yesterday);

        return view();
    }

    public function checkin()
    {
        // 签到登记功能，对接 扫码签到

        $out_trade_no = input('out_trade_no');


        if ($out_trade_no) {
            // 积分充值操作


            // 通过数据库的order订单表查看已经充值status=1
            $total_amount = Order::where('out_trade_no', $out_trade_no)
                ->where('user_id', $this->user_id)
                ->where('status', 1)
                ->value('total_amount');


            if (!$total_amount) {
                $this->redirect('/');
            }
        }


        $user_id = Cookie::get('user_id');


        // 判断今天是否有签到记录
        $registration_user = Order::where('user_id', '=', $user_id)
            ->where('status', 1)
            ->where('type', '=', 135)
            ->whereTime('create_time', 'today')
            ->count();


        // 检查昨天是否签到
        $rand = Order::where('type', 135)
            ->where('status', 1)
            ->where('user_id', '=', $user_id)
            ->whereTime('create_time', 'yesterday')
            ->value('rand');

        $rand = $rand + 1;


        // 生成签到记录订单
        $arr = [
            'rand' => $rand,
        ];

        // 更新签到天数
        Order::where('out_trade_no', $out_trade_no)
            ->update($arr);


        if ($registration_user >= 2) {
            # 已经签到直接提示
            $msg = "已签到过，加油！已连续签到".$rand."天";
            return $this->success($msg, 'index/member/registration');
            // return "已连续签到" . $rand . "天";
        }

        // 设置对应奖励的 数
        // if ($rand == 3) {
        //     $reward = 1;
        // } elseif ($rand == 8) {
        //     $reward = 3;
        // } elseif ($rand == 16) {
        //     $reward = 6;
        // } elseif ($rand == 32) {
        //     $reward = 18;
        // } elseif ($rand > 32) {
        //     $reward = 1;
        // } else {
        //     $reward = 1;
        // }

        $arr = [
            "user_id" => $user_id,
            "money"   => $rand,
            "title"   => '扫码签到奖励',
            "content" => '扫码签到奖励'
        ];

        // 积分奖励
        $money = new Money();
        $money->data($arr);
        $money->save();

        $msg = "恭喜您，连续签到".$rand."天";
        //设置成功后跳转页面的地址，默认的返回页面是$_SERVER['HTTP_REFERER']
        return $this->success($msg, 'index/member/registration');
        // return "恭喜您，连续签到" . $rand . "天";


    }

    public function vip()
    {
        $phone = Cookie::get('phone');

        // if (!$phone){
        //     return $this->success('邀请前，请先登录', 'index/login');;
        // }

        if (!$phone) {
            $phone = 15966982315;
        }


        $user = User::where('phone', '=', $phone)->find();

//        dump($user->toArray());

        $user = $user->toArray();

        $start_time = $user['start_time'];

//       return $time;


        //增加的人性化时间

        $expiration_time = $user['expiration_time'];


        $time2 = $expiration_time;


        $time1 = strtotime(date("Y - m - d H:i:s"));                              //获取当前时间
        $time2 = strtotime($expiration_time);                              //五一放假时间
        $time3 = strtotime("2017 - 5 - 5");                              //端午放假时间

        $sub1 = ceil(($time2 - $time1) / 3600);                            //（60秒*60分）秒/小时
        $sub2 = ceil(($time3 - $time1) / 86400);                           //（60秒*60分*24小时）秒/天


//        return $sub1;


        $vip_day = 1;

        // 简易抢购vip判断功能，赋值语句 
        // date_default_timezone_set("Asia / Shanghai");

        // 判断当前是几点几分 915是9点15
        $secondkill = intval(date("Hi"));

        if ($secondkill > "900" && $secondkill < "915") {
            // code
            $secondkill = 900;
        }


        $this->assign('secondkill', $secondkill);
        $this->assign('user', $user);
        $this->assign('vip_day', $vip_day);

        return view();
    }

    public function money()
    {
        $out_trade_no = input('out_trade_no');
        if ($out_trade_no) {
            // 积分充值操作


            // 通过数据库的order订单表查看已经充值status=1
            $total_amount = Order::where('out_trade_no', $out_trade_no)
                ->where('user_id', $this->user_id)
                ->where('status', 1)
                ->value('total_amount');


            if (!$total_amount) {
                $this->redirect('index/member/money');
            }

            $money_order = Money::where('out_trade_no', $out_trade_no)->count();
            // 如果已经充值过，那么结束
            // 检验增加一个标记，记录充值记录
            if ($money_order) {
                $this->redirect('index/member/money');
            }


            // 没有充值的进行充值操作，积分等于 金额*10
            // 增加一个标记，记录充值记录
            if (!$money_order) {
                $arr = [
                    'user_id'      => $this->user_id,
                    'money'        => $total_amount * 10,
                    'out_trade_no' => $out_trade_no,
                    'content'      => '充值'.$total_amount.'元',

                ];

                $money = new Money();
                $money->data($arr);
                $money->save();

                $this->redirect('index/member/money');
            }
        }


        // 查询用户积分的方法

        $user_id = $this->user_id;


        $money = Money::where('user_id', $user_id)
            ->sum('money');

        $integral = Money::where('user_id', $user_id)
            ->where('money', '>', 0)
            ->sum('money');

        $list = Money::where('user_id', $user_id)
            ->order('id desc')
            ->paginate(30);


//        echo "您的金币：".$money ."您的总积分：".$integral;


        $this->assign('money', $money);
        $this->assign('integral', $integral);
        $this->assign('list', $list);
        $this->assign('title', '积分金币');

        return view();
//        return $this->fetch();


    }

    public function fgetcsv()
    {
        $phone = Cookie::get('phone');
        $file  = fopen("tom666".$phone." . csv", "r");
        while (!feof($file)) {
            dump(fgetcsv($file));
        }
        fclose($file);
    }

    public function fputcsv()
    {
        header("content - type:text / html; charset=utf - 8");

//      $line=array(1,'学习—中文乱码',12345,'vb200',iconv("UTF - 8", "GB2312//IGNORE", "学习—中文乱码"));
        $line = array(1, '学习—中文乱码', 12345, 'vb200', '学习中文乱码');

        foreach ($line as &$value) {
            $value = iconv("UTF-8", "GB2312//IGNORE", "$value");
//            echo "$value <br>";
        }

//        iconv("UTF-8", "GB2312//IGNORE", $value);  //这里将utf-8转为GB2312编码进行保存


        $file = fopen("tom666.csv", "w");


        fputcsv($file, $line);


        fclose($file);

        die();

//      运行这个方法，然后到你的public目录会看到一个导出的csv文件
//      快速实现导出功能示例

        $phone = Cookie::get('phone');

        $list = array
        (
            "thinkphp5,123456789123456789,thinkphp7,USA",
            "James,Adrew,Martin,USA",
        );


        // 查询状态为1的用户数据 并且每页显示10条数据
        $list = Video::where('phone', $phone)
            ->order('update_time desc')
            ->paginate();

//        dump($list);
//        die();


        $file = fopen("tom666".$phone.".csv", "w");


        $value = array
        (
            "id",
            "phone",
            "IP",
            "...",
        );

//        $value=eval('return '.iconv('gbk','utf-8',var_export($value,true)).';');
        //Windows下使用BOM来标记文本文件的编码方式
//        fwrite($file ,chr(0xEF).chr(0xBB).chr(0xBF));

//        $value="\xEF\xBB\xBF".$value; //添加BOM

        fputcsv($file, $value);


        foreach ($list as $value) {
            $value = $value->toarray();

//            $value=array($value);
//            dump($value);
            fputcsv($file, $value);
        }
//        echo "导出成功 <a href=/"."tom666".$phone.".csv> 点击保存</a>";
        echo 123;


        fclose($file);
//  重定向到指定的URL地址 并且使用302
        $this->redirect("/tom666".$phone.".csv", 302);
    }

    public function invite()
    {
        $body     = input('id');
        $phone    = Cookie::get('phone');
        $integral = '';
        $list     = '';
        $money    = '';

        // if (!$phone){
        //     return $this->success('邀请前，请先登录', 'index/login');;
        // }


        // 获取用户id
        $id = User::where('phone', '=', $phone)->value('id');
        // 统计邀请数量
        $invite = User::where('invite', '=', $id)->count();
        // 统计未兑换数量
        $invite_status = User::where('invite', '=', $id)->where('status', '<=', 0)->count();

        $money = Money::where('phone', $phone)
            ->sum('money');

        $integral = Money::where('phone', $phone)
            ->where('money', '>', 0)
            ->sum('money');
        if ($invite) {
            # 查询已邀请的名单
            // 查询状态为1的用户数据 并且每页显示10条数据
            $list = User::where('invite', $id)
                ->order('id desc')
                ->paginate(20);
            // dump($list);


        }
// 把分页数据赋值给模板变量list
        $this->assign('list', $list);
        $this->assign('money', $money);
        $this->assign('integral', $integral);
        // dump($invite);
        if ($body) {
            // 兑换课程
            // dump($id);
            if (!$phone) {
                // 如果未登录跳转到登录页面
                $this->success('兑换前，请先登录', 'index/login');
            }
            // 查询是否有足够金币
            if ($money >= 10) {
                // return  "开始兑换";

                // 写入订单
                $order = Order::create(
                    [
                        'phone'        => $phone,
                        'body'         => $body,
                        'subject'      => "使用10学习币兑换 课程 id：".$body,
                        'total_amount' => 0,
                        'buyer_id'     => $phone,
                        'buyer_email'  => $phone,
                        'out_trade_no' => $phone,
                    ]
                );
//                // 更新兑换券状态
//                $tom=User::where('invite', $id)
//                    ->where('status',0)
//                    ->limit(1)
//                    ->order('id asc')
//                    ->update(['status' => $body]);
                $money = Money::create(
                    [
                        'phone'   => $phone,
                        'money'   => '-10',
                        'content' => "使用10学习币兑换 课程 id：".$body,

                    ]
                );

                // dump($tom);
                // $this->success('兑换成功', '__ROOT__/index/index/view/id/' . $body);
                // 第一次用这个知识点，带参数提示跳转写法 标记
                $this->success('兑换成功^_^', url("index/view", array('id' => $body)));
                die;
            } else {
                // 没有兑换券了
                $this->success('无足够学习币，邀请1个好友注册双方均可获得100金币奥~', 'index/member/invite');
            }
            // 查询是否有兑换券
            if ($invite_status = 166) {
                # code...
                // return  "开始兑换";

                // 写入订单
                $order = Order::create(
                    [
                        'phone'        => $phone,
                        'body'         => $body,
                        'subject'      => "使用兑换券兑换 课程 id：".$body,
                        'total_amount' => 0,
                        'buyer_id'     => $phone,
                        'buyer_email'  => $phone,
                        'out_trade_no' => $phone,
                    ]
                );
                // 更新兑换券状态
                $tom = User::where('invite', $id)
                    ->where('status', 0)
                    ->limit(1)
                    ->order('id asc')
                    ->update(['status' => $body]);

                // dump($tom);
                // $this->success('兑换成功', '__ROOT__/index/index/view/id/' . $body);
                // 第一次用这个知识点，带参数提示跳转写法 标记
                $this->success('兑换成功^_^', url("index/view", array('id' => $body)));
                die;
            } else {
                // 没有兑换券了
                $this->success('无兑换券，立即邀请好友一起学习即可获得兑换券', 'index/member/invite');
            }
        }

        $this->assign('id', $id);
        $this->assign('invite', $invite);
        $this->assign('invite_status', $invite_status);

        return $this->fetch();
    }

    public function diary()
    {
        $body          = input('id');
        $phone         = Cookie::get('phone');
        $invite_status = '';
        if (!$phone) {
            return $this->success('查看学习进度，请先登录', 'index/login');;
        }


        // 统计获得红包数量
        $invite = Video::where('phone', $phone)
            ->where('status', '>=', 1)
            ->count();


        # 查询已邀请的名单
        // 查询状态为1的用户数据 并且每页显示10条数据
        $list = Video::where('phone', $phone)
            ->order('update_time desc')
            ->paginate(20);

//             dump($list);

        // 把分页数据赋值给模板变量list
        $this->assign('list', $list);


        // dump($invite);
        if ($body) {
            // 兑换课程
            // dump($id);
            if (!$phone) {
                // 如果未登录跳转到登录页面
                $this->success('兑换前，请先登录', 'index/login');
            }
            // 查询是否有兑换券
            if ($invite_status) {
                # code...
                // return  "开始兑换";

                // 写入订单
                $order = Order::create(
                    [
                        'phone'        => $phone,
                        'body'         => $body,
                        'subject'      => "使用兑换券兑换 课程 id：".$body,
                        'total_amount' => 0,
                        'buyer_id'     => $phone,
                        'buyer_email'  => $phone,
                        'out_trade_no' => $phone,
                    ]
                );

                // dump($tom);
                // $this->success('兑换成功', '__ROOT__/index/index/view/id/' . $body);
                // 第一次用这个知识点，带参数提示跳转写法 标记
                $this->success('兑换成功^_^', url("index/view", array('id' => $body)));
                die;
            } else {
                // 没有兑换券了
                $this->success('无兑换券，立即邀请好友一起学习即可获得兑换券', 'index/member/invite');
            }
        }


        $this->assign('invite', $invite);


        return $this->fetch();
    }

    public function learning()
    {
        $body  = input('id');
        $phone = Cookie::get('phone');


        // 统计获得红包数量
        $invite = Video::where('status', 1)
            ->count();


        # 查询已邀请的名单
        // 查询状态为1的用户数据 并且每页显示10条数据
        $list = Video::order('update_time desc')
            ->paginate(20);

//         dump($list);

        // 把分页数据赋值给模板变量list
        $this->assign('list', $list);


        // dump($invite);
        if ($body) {
            // 兑换课程
            // dump($id);
            if (!$phone) {
                // 如果未登录跳转到登录页面
                $this->success('兑换前，请先登录', 'index/login');
            }
        }


        $this->assign('invite', $invite);


        return $this->fetch();
    }
}