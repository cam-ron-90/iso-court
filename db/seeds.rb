require "open-uri"

# Making Users
puts "Making Users"
NAMES = ["Paal", "Manon", "Wes", "Cam", "Sy", "Nico", "Marty", "Euan", "Juliette", "Ben"]
AVATARS = ['https://res.cloudinary.com/wagon/image/upload/c_fill,h_520,w_390/v1542929961/pilurti5mqxl5lqtdfbo.jpg',
  'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_600,w_600/v1578983665/pehhgoh4j73r6s8cd17x.jpg',
  'https://avatars2.githubusercontent.com/u/59460658?s=460&u=b9809ba6536770f2b54d2c25aa91626c3f92e334&v=4.png',
  'https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/user_photos/001/011/084/datas/xlarge.png',
  'https://tse2.explicit.bing.net/th?id=OIP.yoSXOAJJypVbA6VH66pvlwHaFj&pid=Api.png',
  'https://www.nicoproto.com/images/nico.jpg',
  'https://images.squarespace-cdn.com/content/v1/5cabdc9c809d8e269de92d7b/1555067191881-XSQNJT8YXRZ6DSPJWE4B/ke17ZwdGBToddI8pDm48kDkt_mEUwPAwWp3BKCAozPR7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmAwVFR4PZiyK_KQHbHPYr0gKRgP3DEF25GW_LoqZgyW28rk2vDgrzVyw4LqtvFwtU/Marty.png',
  'https://acutecadaver.com/upimages/image_ccp1113_47DCF41A.jpg',
  'https://avatars2.githubusercontent.com/u/54906060?v=4?height=180&width=180.png',
  'https://miro.medium.com/max/3150/2*op_ylpYhDZpQuxB0xSCZ5A.jpeg']
NAMES.each_with_index do |name, ind|
  user = User.new(username: name, password: "password", email: "#{name}@user.com")
  file = URI.open(AVATARS[ind])
  user.avatar.attach(io: file, filename: "#{name}.png", content_type: 'image/png')
  user.save!
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
  UserCharge.create(user_id: the_user, charge_id: Charge.last.id, hearing_id: Hearing.last.id, judge_id: User.all.ids.select { |x| x != the_user }.sample, verdict: "Pending" )
  puts "Charge Against #{User.find(UserCharge.last.user_id).username} for #{Charge.last.category}, judged by #{User.find(UserCharge.last.judge_id).username}"
end
#Making Commitments
8.times do
  Commitment.create(category: "#{CATEGORY.sample}", description: TDESC, group_id: Group.last.id, hearing_id: Hearing.last.id)
  the_user = User.all.sample.id
  UserCommitment.create(user_id: the_user, commitment_id: Commitment.last.id)
  puts "Made Commitment for #{User.find(the_user).username} for #{Commitment.last.category}"
end
