User.destroy_all
u = User.create :email => "cale.s@gmail.com", :password => 'chicken'
TodoList.destroy_all
l = TodoList.create :title => 'Whatever'
Task.destroy_all
t1 = Task.create :name => 'Task 1', :complete => false
t2 = Task.create :name => 'Task 2', :complete => true

l.tasks << t1 << t2
u.todo_lists << l