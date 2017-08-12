Trestle.resource(:posts) do
  menu do
    item :posts, icon: "fa fa-newspaper-o", group: :post_managment
  end


  scope :all, default: true
  scope :published, -> {Post.published}
  scope :drafts, -> {Post.unpublished}


  # Customize the table columns shown on the index view.

  table do
    column :id
    column :title
    column :status do |post|
      post.status.status
    end
    column :updated_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |post|
    text_field :title
    editor :body

    select :status_id, Status.all.map {|status| [status.status, status.id]}
    # col(sm: 6) { tag_select :tags }
    # row do
    #   col(xs: 6) { datetime_field :updated_at }
    #   col(xs: 6) { datetime_field :created_at }
    # end
  end

# By default, all parameters passed to the update and create actions will be
# permitted. If you do not have full trust in your users, you should explicitly
# define the list of permitted parameters.
#
# For further information, see the Rails documentation on Strong Parameters:
#   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
#
# params do |params|
#   params.require(:post).require(:name, ...)
# end
end
