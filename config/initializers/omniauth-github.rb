Rails.application.config.middleware.use OmniAuth::Builder do
  puts "X#{ENV['GITHUB_KEY']}X"
 puts "X#{ENV['GITHUB_SECRET']}X"
 provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,user:email"
end