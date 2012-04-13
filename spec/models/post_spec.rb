require 'spec_helper'

describe Post do
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of   :title }
  it { should validate_presence_of   :body  }
  it { should validate_presence_of   :type  }

  let(:post) do
    Post.new
  end

  describe ".set_date" do
    it "should set the date to equal the created at date or the current Time" do
      post.save
      post.pubdate.should ==  post.created_at
    end
  end

end
