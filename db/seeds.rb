User.destroy_all
Quiz.destroy_all
UserQuiz.destroy_all
UserAnswer.destroy_all
Question.destroy_all
Answer.destroy_all

u1 = User.create(:name => 'Bob', :email => 'bob@gmail.com', :password => 'a', :password_confirmation => 'a', :address => '5 Queen St, Woollahra, NSW 2025')
u2 = User.create(:name => 'Sue', :email => 'sue@gmail.com', :password => 'a', :password_confirmation => 'a', :address => '25 Bourke St, Melbourne, 3000')
u3 = User.create(:name => 'Sam', :email => 'sam@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Sydney opera house, Sydney')

q1 = Quiz.create(:name => 'Ajax', :description => 'Think you know AJAX? Take the quiz and see how you measure up')
q2 = Quiz.create(:name => 'TDD', :description => 'Try our TDD quiz which promises to TEST you to your limits')
q3 = Quiz.create(:name => 'Backbone.js', :description => 'Give our backbone quiz a shot and prove you can really build single page apps')

qu1 = Question.create(:content => 'Name the king who failed to keep an eye on things at the battle of Hastings')
qu2 = Question.create(:content => 'In which sport would you use a chucker?')
qu3 = Question.create(:content => 'If a snail climbed up a 12 ft wall at a steady rate of 3 feet a day, but slipped down 2ft every night, how many days would it take him to reach the top ?')
qu4 = Question.create(:content => 'Traditionally, what type of wood do Rolls Royce use on the dashboards of their cars?')
qu5 = Question.create(:content => 'What is the national emblem of Canada?')
qu6 = Question.create(:content => 'Why is Dan Addington such a legend?')

a1 = Answer.create(:content => 'Harold', :is_correct => true)
a2 = Answer.create(:content => 'Polo', :is_correct => true)
a3 = Answer.create(:content => '10 days', :is_correct => true)
a4 = Answer.create(:content => 'Walnut', :is_correct => true)
a5 = Answer.create(:content => 'Maple Leaf', :is_correct => true)
a6 = Answer.create(:content => 'He just is.', :is_correct => true)
a7 = Answer.create(:content => 'George the second', :is_correct => false)

q1.questions << qu1 << qu2 << qu3 << qu4 << qu5 << qu6
q1.save
q2.questions << qu1 << qu2 << qu3 << qu4 << qu5 << qu6
q2.save
q3.questions << qu1 << qu2 << qu3 << qu4 << qu5 << qu6
q3.save

qu1.answers << a1 << a7
qu1.save
qu2.answers << a2
qu2.save
qu3.answers << a3
qu3.save
qu4.answers << a4
qu4.save
qu5.answers << a5
qu5.save
qu6.answers << a6
qu6.save