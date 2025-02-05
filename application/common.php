<?php

namespace app\index\controller;

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件


use app\index\model\Money;
use think\Db;
use think\Request;
use app\index\model\Shop;
use app\index\model\Video;
use app\index\model\User;
use app\index\model\Sms;
use app\index\model\Order;
use app\index\model\Data;
use app\index\model\Footprint;
use app\index\model\Ipinfo;
use think\Cookie;
use think\Session;
use think\Validate;
use Ip2Region;


/**
 * @param  string  $url  网址
 * @param  string  $filename  保存文件名
 * @param  int  $timeout  过期时间
 * @return bool|string
 */
function http_down($url, $filename, $timeout = 60)
{
    $path = dirname($filename);
    if (!is_dir($path) && !mkdir($path, 0755, true)) {
        return false;
    }
    $fp = fopen($filename, 'w');
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_exec($ch);
    curl_close($ch);
    fclose($fp);
    return $filename;
}

function admin_test_model()
{
    // 首页地址栏加入参数 test=1将开启开发人员测试功能
    // test=0 关闭测试功能
    // 此函数跟随随网站统计尾部运行
    // 作用：  查看当前用户所有请求信息，也可以用于用户自身使用

    if (input('test') >= 1) {
        //            开发人员测试用 ，可以设置一个公共函数，做为调用使用
        echo "您已开启检查请求信息功能";
        echo "点击此处关闭检查功能";
        $request = Request::instance();
        // 获取当前域名
        echo 'domain: '.$request->domain().'<br/>';
        // 获取当前入口文件
        echo 'file: '.$request->baseFile().'<br/>';
        // 获取当前URL地址 不含域名
        echo 'url: '.$request->url().'<br/>';
        // 获取包含域名的完整URL地址
        echo 'url with domain: '.$request->url(true).'<br/>';
        // 获取当前URL地址 不含QUERY_STRING
        echo 'url without query: '.$request->baseUrl().'<br/>';
        // 获取URL访问的ROOT地址
        echo 'root:'.$request->root().'<br/>';
        // 获取URL访问的ROOT地址
        echo 'root with domain: '.$request->root(true).'<br/>';
        // 获取URL地址中的PATH_INFO信息
        echo 'pathinfo: '.$request->pathinfo().'<br/>';
        // 获取URL地址中的PATH_INFO信息 不含后缀
        echo 'pathinfo: '.$request->path().'<br/>';
        // 获取URL地址中的后缀信息
        echo 'ext: '.$request->ext().'<br/>';


        $request = Request::instance();
        echo '请求方法：'.$request->method().'<br/>';
        echo '资源类型：'.$request->type().'<br/>';
        echo '访问ip地址：'.$request->ip().'<br/>';
        echo '是否AJax请求：'.var_export($request->isAjax(), true).'<br/>';
        echo '请求参数：';
        dump($request->param());
        echo '请求参数：仅包含name';
        dump($request->only(['phone']));
        echo '请求参数：排除name';
        dump($request->except(['phone']));

        echo "获取全部的session变量";
        dump(Request::instance()->session()); // 获取全部的session变量
        echo "获取全部的cookie变量";
        dump(Request::instance()->cookie()); // 获取全部的cookie变量
    }
}

function ip1region()
{
    $request = Request::instance();

    $ip = $request->ip();

    if (!$ip or $ip == '127.0.0.1') {
        // return "ok";
    }

    $ip2region = new Ip2Region();


    $info = $ip2region->btreeSearch($ip);

    $check   = Ipinfo::where('ip', $ip)->count();
    $user_id = Cookie::get('user_id');

    if ($check) {
        $user = new Ipinfo;
        // save方法第二个参数为更新条件
        $user->save(
            [
                'user_id' => $user_id,
            ],
            ['ip' => $ip]
        );
        return '';
    }


    $isp = $info['city_id'];
    $pos = $info['region'];

    $pos = str_replace('中国', '', $pos);
    $pos = str_replace('|', '', $pos);
    $pos = str_replace('0', '', $pos);


    if ($pos) {
        Ipinfo::create(
            [
                'region'  => $pos,
                'ip'      => $ip,
                'user_id' => $user_id,
            ]
        );
    }
}


function get_user_id($phone)
{
    $user_id = User::where('phone', '=', $phone)->value('id');
    return $user_id;
}

function arraySequence($array, $field, $sort = 'SORT_DESC')
{
    $arrSort = array();
    foreach ($array as $uniqid => $row) {
        foreach ($row as $key => $value) {
            $arrSort[$key][$uniqid] = $value;
        }
    }
    array_multisort($arrSort['view_count'], constant($sort), $array);
    return $array;
}


// 验证课程播放少于10次
function play_count($shop)
{
    // 查询播放记录条数
    $play_count = Video::where('shop', '=', $shop)
        ->count();

    return $play_count;
}


// 验证是否达到所有课程免费的功能
function all_lesson_free()
{
//    说明：
//    有多种情况可以设置为课程免费
//
//
//    例如 每日签到满10人
    $all_lesson_free = 0;


    //        查询今天有多少人签到了
    $registration_count = Order::whereTime('create_time', 'today')
        ->where('body', '=', 135)
        ->where('phone', '<>', '15966982315')
        ->count();


    if ($registration_count >= 10) {
        return 1;
    }


    // 简易全民学习功能  每晚8点-10点免费开放
    // date_default_timezone_set("Asia/Shanghai");

    // 判断当前是几点几分 915是9点15
    $secondkill = intval(date("Hi"));

    if ($secondkill > "2000" && $secondkill < "2200") {
        // code
        return 0;
    }


    return 0;
}

// 增加会员vip天数功能

function add_vip_days($add_vip_days, $out_trade_no)
{
    $user_id = Cookie::get('user_id');


    // 把时间增加上 ，忽略开始日期字段
    // 日期转秒数 60*60*24=1天的秒数


    $expiration_time = User::where('user_id ', $user_id)
        ->whereTime('expiration_time', '>=', '-1 minute')
        ->value('expiration_time');

    $add_vip_days_time = $add_vip_days * 3600 * 24;


    // 判断是否过期
    if ($expiration_time) {
        $expiration_time = $expiration_time + $add_vip_days_time;

        User::where('user_id ', $user_id)
            ->update(['expiration_time' => $expiration_time, 'rand' => 1]);
    } else {
        $expiration_time = time() + $add_vip_days_time;

        User::where('user_id ', $user_id)
            ->update(['expiration_time' => $expiration_time, 'start_time' => time(), 'rand' => 1]);
    }


    // 写入订单
    $order = Order::create(
        [
            'user_id'      => $user_id,
            'body'         => 105,
            'subject'      => "增加VIP会员：".$add_vip_days."天",
            'total_fee'    => 0,
            'buyer_id'     => $user_id,
            'buyer_email'  => $user_id,
            'out_trade_no' => $out_trade_no,
        ]
    );
}

function invite($invite_user, $user_id)
{
    // 奖励邀请用户功能


    //设置增加vip天数,先查询vip到期日期
    $expiration_time = User::where('user_id', $invite_user)
        ->whereTime('expiration_time', '>=', 'today')
        ->value('expiration_time');


    // 如果没到期加上30天，到期了从现在起加上N天
    if ($expiration_time) {
        $expiration_time = $expiration_time + (3600 * 24 * 30);


        User::where('user_id', $invite_user)
            ->update(['expiration_time' => $expiration_time, 'rand' => 1]);
    } else {
        $expiration_time = time() + (3600 * 24 * 30);

        User::where('user_id', $invite_user)
            ->update(['expiration_time' => $expiration_time, 'start_time' => time(), 'rand' => 1]);
    }


    // 通过saveAll方法批量发放金币奖励订单记录

    $user = model('Money');

    $list = [
        [
            'phone'   => $invite_user,
            'money'   => 10,
            'content' => '邀请了会员'.$user_id.'注册奖励',

        ],
        [
            'phone'   => $user_id,
            'money'   => 10,
            'content' => '新注册获得奖励',

        ]
    ];
    $user->saveAll($list);
}

function developerTest()
{
    if (input('test') >= 1) {
        // 开发人员测试用 ，可以设置一个公共函数，做为调用使用
        echo "您已进入开发人员测试环境";
        $request = Request::instance();
        // 获取当前域名
        echo 'domain: '.$request->domain().'<br/>';
        // 获取当前入口文件
        echo 'file: '.$request->baseFile().'<br/>';
        // 获取当前URL地址 不含域名
        echo 'url: '.$request->url().'<br/>';
        // 获取包含域名的完整URL地址
        echo 'url with domain: '.$request->url(true).'<br/>';
        // 获取当前URL地址 不含QUERY_STRING
        echo 'url without query: '.$request->baseUrl().'<br/>';
        // 获取URL访问的ROOT地址
        echo 'root:'.$request->root().'<br/>';
        // 获取URL访问的ROOT地址
        echo 'root with domain: '.$request->root(true).'<br/>';
        // 获取URL地址中的PATH_INFO信息
        echo 'pathinfo: '.$request->pathinfo().'<br/>';
        // 获取URL地址中的PATH_INFO信息 不含后缀
        echo 'pathinfo: '.$request->path().'<br/>';
        // 获取URL地址中的后缀信息
        echo 'ext: '.$request->ext().'<br/>';


        $request = Request::instance();
        echo '请求方法：'.$request->method().'<br/>';
        echo '资源类型：'.$request->type().'<br/>';
        echo '访问ip地址：'.$request->ip().'<br/>';
        echo '是否AJax请求：'.var_export($request->isAjax(), true).'<br/>';
        echo '请求参数：';
        dump($request->param());
        echo '请求参数：仅包含name';
        dump($request->only(['phone']));
        echo '请求参数：排除name';
        dump($request->except(['phone']));

        echo "获取全部的session变量";
        dump(Request::instance()->session()); // 获取全部的session变量
        echo "获取全部的cookie变量";
        dump(Request::instance()->cookie()); // 获取全部的cookie变量
    }
}

//功能浏览次数和来路
function footprint()
{
    $info = [];

    $info['user_id'] = Cookie::get('user_id');

    $request = Request::instance();


    $view = request()->module().request()->controller().request()->action();

    // 如果是产品详情页，记录一下访问的产品id，$goods_id
    if ($view == 'indexIndexview') {
        $info['goods_id'] = input('id');
    }


    //  模块控制器和方法
    $info['module']     = $request->module();
    $info['controller'] = $request->controller();
    $info['action']     = $request->action();
    $info['path']       = $request->url();
    //  获取ip地址
    $info['ip'] = $request->ip();
    Session::get('start_session_working');
    $info['session_id'] = session_id();

    $user = new Footprint;
    $user->data($info);
    $user->save();

    // 开发人员测试
    developerTest();
    // 记录地理位置
    ip1region();
    // 验证用户登录token
    checkToken();
}


// 验证用户是否token功能
function checkToken()
{
    $user_id = Cookie::get('user_id');
    $token   = Cookie::get('token');

    if ($user_id) {
        // 判断是否其他浏览器或者设备登录（设置每次登录修改token时有效）
        // 判断Cookie里的token的否正确
        $token_count = User::where('id', '=', $user_id)
            ->where('token', '=', $token)
            ->count();
        if ($token_count <= 0) {
            Cookie::set('phone', '', 36000000);
            Cookie::set('token', '', 36000000);
            $user  = "";
            $token = "";
        }
    }
}

//人性化时间显示
function formatTime($time)
{
    return $time;
    $rtime = date("m月d日 H:i", $time);
    $htime = date("H:i", $time);
    $year  = date("Y") - date("Y", $time);
    $time  = time() - $time;

    if ($time < 60) {
        $str = '刚刚';
    } elseif ($time < 60 * 60) {
        $min = floor($time / 60);
        $str = $min.'分钟前';
    } elseif ($time < 60 * 60 * 24) {
        $h   = floor($time / (60 * 60));
        $str = $h.'小时前 ';
    } elseif ($time < 60 * 60 * 24 * 3) {
        $d = floor($time / (60 * 60 * 24));
        if ($d == 1) {
            $str = '昨天 '.$rtime;
        } else {
            $str = '前天 '.$rtime;
        }
    } elseif ($year > 0) {
        $str = $rtime;
    } else {
        $str = date("Y年m月d日 H:i", $time);
    }
    return $str;
}
