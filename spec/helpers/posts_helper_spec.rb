require 'rails_helper'

RSpec.describe PostsHelper, :type => :helper do
  context '#create_new_post_partial_path' do

    it "returns a signed_in partial's path" do
      helper.stub(:user_signed_in?).and_return(true)
      expect(helper.create_new_post_partial_path).to( eq'posts/branch/create_new_post/signed_in')
    end

    it "returns a not signed_in partial's path" do
      helper.stub(:user_signed_in?).and_return(false)
      expect(helper.create_new_post_partial_path).to(eq 'posts/branch/create_new_post/not_signed_in')
    end

  end

  context '#all_categories_button_partial_path' do

    it "returns all posts partial path" do
      controller.params[:category] = ''
      expect(helper.all_categories_button_partial_path).to(eq 'posts/branch/categories/all_selected')
    end

    it "returns specific partial path" do
      controller.params[:category] = 'category'
      expect(helper.all_categories_button_partial_path).to (eq 'posts/branch/categories/all_not_selected')
    end
  end

  context '#no_posts_partial_path' do

    it "returns a no posts partial's path" do
      assign(:posts, [])
      expect(helper.no_posts_partial_path).to eq 'posts/branch/no_posts'
    end

    it "returns an empty partial's path" do
      assign(:posts, [1])
      expect(helper.no_posts_partial_path).to eq 'shared/empty_partial'
    end

  end

  context '#post_format_partial_path' do

    it "returns homepage partial path" do
      helper.stub(:current_page?).and_return(true)
      expect(helper.post_format_partial_path).to eq 'posts/post/home_page'
    end

    it "returns branch partial path" do
      helper.stub(:current_page?).and_return(false)
      expect(helper.post_format_partial_path).to eq 'posts/post/branch_page'
    end

  end

  context '#category_field_partial_path' do
    it "returns category field parital's path" do
      controller.params[:category] = 'category'
      expect(helper.category_field_partial_path).to eq 'posts/branch/search_form/category_field'
    end

    it "returns an empty partial's path" do
      controller.params[:category] = ''
      expect(helper.category_field_partial_path).to eq 'shared/empty_partial'
    end
  end

  context '#update_pagination_partial_path' do
    it "returns update pagination partial path" do
      posts = double('posts', :next_page => 2)
      assign(:posts, posts)
      expect(helper.update_pagination_partial_path).to eq 'posts/posts_pagination_page/update_pagination'
    end

    it "returns remove pagination partial path" do
      posts = double('posts', :next_page => nil)
      assign(:posts, posts)
      expect(helper.update_pagination_partial_path).to eq 'posts/posts_pagination_page/remove_pagination'
    end
  end

end
