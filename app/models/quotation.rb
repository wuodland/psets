class Quotation < ApplicationRecord

    def self.search(search)
      where("quote LIKE", "%#{search}%")
    end
    validates_presence_of :author_name, :message => "Please enter author name"
    validates_presence_of :category, :message => "Please enter category name"
    validates_presence_of :quote, :message =>"Please enter quote"


  end
