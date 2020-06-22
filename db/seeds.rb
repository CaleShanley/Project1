u = User.create :email => "cale.s@gmail.com", :password => 'chicken'
l = TodoList.create :title => 'Whatever'
t = Task.create :name => 'Task 1'

l.tasks << t 
u.todo_lists << l