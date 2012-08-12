# -*- encoding : utf-8 -*-
#初始化用户
#User.create({
#  :email => "wen-hanyang@163.com", 
#  :password => "123456",
#  :username => "东东"
#})

#初始化category数据
#Category.load_yml_date

content = [
  "都说双鱼是感性的，但是仔细观察，双鱼们似乎却是超乎的理性。",
  "那是因为双鱼总是变来变去，前后不一致，很多人认为这样便是没有理性。实际上，恰恰是因为他们太有理性，思前想后，前前后后的想，才造成了逻辑上不统一",
  "感受自己的情绪，真实的表达出来。而不要压抑到无可挽回",
  "平衡星座：射手座（I see）。每个星座的平衡星座都是往前数的第3个星座。双鱼的骨子里太过感性，一味的信任是他们总是感到受伤，学习射手座“看”的智慧，在充分信任的同时，尝试着去“看到”，看看别人的模式和状态，而不是要么一味的盲信，要么理智的分析。学会去看，不加评判的，看到：原来世界是这样",
  "不是外而是内：你是不是很讨厌被别人不信任呢？好好的感受一下，那真的是讨厌别人对自己的不信任，还是因为你丢失了自己原本的信任"
]
(1..50).each do 
  file = File.new(File.join(Rails.root,"db/features","#{rand(10)+1}.jpg"),"r")
  photo = Photo.new({
   :content => content[rand(4)],
   :file => file,
   :tag_list => "美女,图片,动物,野生动物",
   :category_id => 30
  })
  photo.user = User.first
  photo.save
end
