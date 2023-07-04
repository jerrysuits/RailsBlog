class PostDeletionJob < ApplicationJob
  queue_as :low_priority
  # high_priority
  # default

  def perform(id)
    post = Post.find_by(id: id)
    if post.present? && post.archive?
      post.destroy
    end
    
    puts "xxxxx"
    puts "DELETED"
  end
end
