namespace :export do
  desc "Prints dbgit in a seeds.rb way."
  task :seeds_format => :environment do
    #Export User
    User.order(:id).all.each do |user|
      puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    #Export Article
    Article.order(:id).all.each do |article|
      puts "Article.create(#{article.serializable_hash.delete_if {|key, value| ['created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    #Export Category
    Category.order(:id).all.each do |category|
      puts "Category.create(#{category.serializable_hash.delete_if {|key, value| ['created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    #Export Category
    ArticleCategory.order(:id).all.each do |article_catogory|
      puts "ArticleCategory.create(#{article_catogory.serializable_hash.delete_if {|key, value| ['created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end