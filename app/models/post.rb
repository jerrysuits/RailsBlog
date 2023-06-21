class Post < ApplicationRecord
    # validates :title, presence: true, uniqueness: true, 
    #                    length: {minimum: 10, maximum: 15}
    # validates :content, presence: true

    validates :title, presence: {message: "is required!"}, 
                      uniqueness: {message: "already exists in our DB!"},
                      length: {minimum: 10, too_short: "is too short. We need a minimum of %{count}"}

    validates :content, presence: true


    def delete_after_sometime
        update(archive: true)
        PostDeletionJob.set(wait: 20.seconds).perform_later(id)
    end
end
