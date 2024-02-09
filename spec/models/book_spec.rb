require 'rails_helper'

RSpec.describe Book, type: :model do
  it "belongs to an author" do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq :belongs_to
  end

  it "cannot be created without an author" do
    book = Book.new(title: "Orphan Book")
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("must exist")
  end

  it "is valid with a valid author" do
    author = Author.create(name: "Valid Author")
    book = author.books.build(title: "Valid Book")
    expect(book).to be_valid
  end
end
