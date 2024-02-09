require 'rails_helper'

RSpec.describe Author, type: :model do
  it "has many books" do
    association = described_class.reflect_on_association(:books)
    expect(association.macro).to eq :has_many
  end

  it "deletes books when the author is deleted" do
    author = Author.create(name: "Author Name")
    author.books.create(title: "Book Title")
    expect { author.destroy }.to change { Book.count }.by(-1)
  end
end
