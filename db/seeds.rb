# Making Users
puts "Making Users"
NAMES = ["Paal", "Manon", "Wes", "Cam", "Sy", "Nico", "Harry", "Euan", "Stacy", "Ben"]
NAMES.each do |name|
  User.create(username: name, password: "password", email: "#{name}@user.com")
  puts "Email: #{User.last.email}"
end
# Making Group
puts "making Group"
group_admin = rand(1..10)
Group.create(name: "Friends Together", admin_id: group_admin)
puts "Group #{Group.last.name} - admin is #{User.find(Group.last.admin_id).username}"
#Putting Current Users in Group
group_people = (1..10).to_a.select{ |x| x != group_admin }
group_people.each do |x|
  UserGroup.create(user_id: x, group_id: Group.last.id, status: "member")
end
# Hearing is automatically created from Group
# Laws
LAWS = ["Wash Hands Daily", "Contact Someone Each day", "Only Order Take away once a week", "Code each day"]
puts "making laws"
LAWS.each do |law|
  Law.create(name: law, group_id: Group.last.id)
  puts "New Law: #{Law.last.name}"
end
# Making some labels for stuff used for Charges and Commitments
CATEGORY = ["Hygiene", "Media",
  "Information", "Social distancing", "Calm approach",
  "Fight boredom", "Positive focus", "Social connection", "Physical activity",
  "Work from home", "Tidying"]
TDESC = "Testing Description just so it shows something"
#Making Charges
8.times do
  Charge.create(category: "#{CATEGORY.sample}", description: TDESC, group_id: Group.last.id)
  the_user = User.all.sample.id
  UserCharge.create(user_id: the_user, charge_id: Charge.last.id, hearing_id: Hearing.last.id, judge_id: User.all.ids.select { |x| x != the_user }.sample )
  puts "Chage Against #{User.find(UserCharge.last.user_id).username} for #{Charge.last.category}, judged by #{User.find(UserCharge.last.judge_id).username}"
end
#Making Commitments
8.times do
  Commitment.create(category: "#{CATEGORY.sample}", description: TDESC, group_id: Group.last.id, hearing_id: Hearing.last.id)
  the_user = User.all.sample.id
  UserCommitment.create(user_id: the_user, commitment_id: Commitment.last.id)
  puts "Made Commitment for #{User.find(the_user).username} for #{Commitment.last.category}"
end
