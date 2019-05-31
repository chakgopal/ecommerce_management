class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true, foreign_key: :category_id
  has_many :children, class_name: 'Category', dependent: :destroy

  def all_children_iteration
    childs_to_visit = children.to_a
    childs_to_return = []
    while childs_to_visit.present?
      current_node = childs_to_visit.shift
      childs_to_return << current_node
      childs_to_visit.concat(current_node.children)
    end
    childs_to_return
  end  
  
  
end
