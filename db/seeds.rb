# -*- encoding : utf-8 -*-
#初始化category数据
dw = Category.create(:name => "野生动物")
#zw = Category.create(:name => "野生植物")

d1 = Category.create(:name => "猫科动物")
d2 = Category.create(:name => "东北虎科")

d11 = Category.create(:name => "加菲猫")
d12 = Category.create(:name => "家猫")

d21 = Category.create(:name => "华南虎")
d22 = Category.create(:name => "东北虎")

d11.move_to_child_of d1
d12.move_to_child_of d1

d21.move_to_child_of d2
d22.move_to_child_of d2

dw.children << d1
dw.children << d2
dw.save

#z1 = Category.create(:name => "野生花科")
#z2 = Category.create(:name => "野生数科")
#zw.chidren << z1
#zw.chidren << z2