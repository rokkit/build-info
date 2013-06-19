# encoding: UTF-8
ActiveAdmin.register Article do
  menu parent: "Наполнение сайта", priority: 0
  action_item only: :show do
        button_to "Одобрить регистрацию", publish_admin_article_path, method: :post
  end
  # # Available at /admin/posts/1/approve and #approve_admin_post_path(post)
    member_action :publish, :method => :post do
      # Just a regular controller method in here
      article = Article.find params[:id]
      article.publish!
      redirect_to admin_article_path(article)
    end
end
