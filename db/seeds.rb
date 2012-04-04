# encoding: utf-8
Generica.delete_all
Label.delete_all
Museo.delete_all
Museo.create([{:nombre => 'Museo Robledillo'}, {:nombre => 'Molino de Cañada del Rosal'}])
l1=Label.create(:nombre=>'p1')
l2=Label.create(:nombre=>'p2')
Label.create([{:nombre=>'p1.1', :label=>l1}, {:nombre=>'p1.2', :label=>l1}, {:nombre=>'p1.3', :label=>l1}])
Label.create([{:nombre=>'p2.1', :label=>l2}, {:nombre=>'p2.2', :label=>l2}, {:nombre=>'p2.3', :label=>l2}])