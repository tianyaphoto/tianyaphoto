# -*- encoding : utf-8 -*-
#初始化用户
User.create({
  :email => "wen-hanyang@163.com", 
  :password => "123456",
  :username => "东东"
})

#初始化category数据
Category.load_yml_date

