class Tag < ApplicationRecord
    before_validation :downcase_name

    has_many :taggings, dependent: :destroy
    has_many :questions, through: :taggings#, source: :question  -> don't need to give a source if the source is the singular of the association (i.e. question for questions)

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    #Javascript and javascript - the case_sensitive option will make the uniqueness
    #vakidation ignore the case, so two records of the same name will not co-exist

    def downcase_name
        # puts self.name
        self.name&.downcase!
    end
end
