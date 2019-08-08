namespace :export do
  desc "Prints Article.all and User.all in a seeds.rb way."
  task :seeds_format => :environment do
    #Export User
    User.order(:id).all.each do |user|
      puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    #Export Article
    Article.order(:id).all.each do |article|
      puts "Article.create(#{article.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end