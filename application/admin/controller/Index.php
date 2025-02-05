<?php

namespace app\admin\controller;

use app\admin\model\Admin;
use app\common\controller\Backend;
use think\Db;
use think\Request;
use app\index\model\User;
use app\index\model\Shop;
use think\Cookie;

class Index extends Backend
{


    public function logout()
    {

            // 设置Cookie 有效期为 秒
            Cookie::set('admin_username', '', 1);
            Cookie::set('admin_id', '', 1);
            Cookie::set('admin_token', '', 1);
            // $warning ="退出成功";
            return $this->success('退出成功^_^', 'admin/login/index');

    }

    public function update()
    {
        $id      = input('id');
        $title   = input('param.title');
        $content = input('param.content');
        $content = Request::instance()->param('content', '', null);
        $price   = input('param.price');
        $label   = input('param.label');
        $address = input('param.address');
        $sort    = input('param.sort');
        $product = input('param.product');

        if (!$id) {
            return "商品id不能为空";
        }

        // 取出主键为1的数据
        $list = Shop::get($id);
        // echo $user->name;
        // dump($list);


        if ($title) {
            // return $price;
            // 模型的 静态方法
            Shop::update(
                [
                    'id'      => $id,
                    'title'   => $title,
                    'price'   => $price,
                    'content' => $content,
                    'label'   => $label,
                    'address' => $address,
                    'sort'    => $sort,
                    'product' => $product,

                ]
            );

            return $this->success('恭喜商品修改成功^_^', 'show');
        }


        $this->assign('list', $list);


        // 渲染模板输出
        return $this->fetch();
    }


    public function show()
    {
        $show = Shop::where('id', '>', 0)->order('sort', 'desc')->paginate(5, 30);


        $show = Db::name("shop")->order('sort', 'desc')->paginate(10);


        $this->assign('show', $show);
        // 渲染模板输出

        return $this->fetch();
    }

    public function upload()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image');

        // 移动到框架应用根目录/public/uploads/ 目录下
        if ($file) {
            $info = $file->move(ROOT_PATH.'public'.DS.'uploads');
            if ($info) {
                // 成功上传后 获取上传信息
                // 输出 jpg
                echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getFilename();
            } else {
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }
    }

    public function header()
    {
        $this->assign('show', "header");
        // 渲染模板输出
        return $this->fetch();
    }

    public function footer()
    {
        // 渲染模板输出
        return $this->fetch();
    }

    public function index()
    {
        $this->assign('title', '后台首页');
        return $this->fetch();
    }

    public function view()
    {
        //echo input('param.id');

        $id = input('id');

        if ($id <> '') {
            // 查询数据 - 查询留言详情内容
            $list = Db::name('shop')
                ->where('id', '=', $id)
                ->select();
            // dump($list);

            // 查询数据 - 上一页
            //echo $id;
            $up = Db::name('shop')
                ->where('id', '>', $id)
                ->order('id', '')
                ->limit(1)
                ->value('id');
            //dump($up);

            // 查询数据 - 下一页
            $next = Db::name('shop')
                ->where('id', '<', $id)
                ->order('id', 'desc')
                ->limit(1)
                ->value('id');

            //dump($next);

            $this->assign('up', $up);
            $this->assign('next', $next);
            $this->assign('list', $list);


            // 渲染模板输出
            return $this->fetch();
        }
        return $this->fetch('no');
        return "留言不存在";
    }

    public function add()
    {
        $title   = input('param.title');
        $content = input('content');
//        $content = Request::instance()->param('content','','htmlspecialchars');
        $content = Request::instance()->param('content', '', null);
        $price   = input('price');
        $label   = input('param.label');
        $address = input('param.address');
        $sort    = input('param.sort');
        $product = input('param.product');

//        Request::instance()->get('name','','htmlspecialchars'); // 获取get变量 并用htmlspecialchars函数过滤


        $lesson = "";
        //dump($title);

        if ($title <> '') {
            // 插入记录 - 去掉表前缀
            // $result = Db::name('data')
            // ->insert(['title' => $title, 'content' => $content, 'create_time' => time()]);
            //dump($result);


            // 获取表单上传文件 例如上传了001.jpg
            $file = request()->file('lesson');

            // 移动到框架应用根目录/public/uploads/ 目录下
            if ($file) {
                $info = $file->move(ROOT_PATH.'public'.DS.'uploads');
                if ($info) {
                    // 成功上传后 获取上传信息
                    // 输出 jpg
                    echo $info->getExtension()."<br>";
                    // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getSaveName()."<br>";
                    // 输出 42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getFilename()."<br>";
                    $lesson = $info->getSaveName();

                    // echo $lesson;
                    // exit();

                } else {
                    // 上传失败获取错误信息
                    echo $file->getError();
                }
            }


            // 模型的 静态方法
            $user = Shop::create(
                [
                    'title'   => $title,
                    'price'   => $price,
                    'lesson'  => $lesson,
                    'content' => $content,
                    'label'   => $label,
                    'address' => $address,
                    'sort'    => $sort,
                    'product' => $product,

                ]
            );

            return $this->success('恭喜您发布课程成功^_^', 'add');
        }

        return $this->fetch();
    }

    public function delete()
    {
        //echo input('param.id');

        $id = input('id');

        $id = 2;


        if ($id <> '') {
            // 或者直接调用静态方法
            Shop::destroy($id);
        }
        return $this->success('删除成功^_^', 'show');
    }

    public function ajax()
    {
        return $this->fetch();
    }
}
 