class RootController < ApplicationController
  def index; end

  def greeting
    string_length = 8
    rand(36**string_length).to_s(36)

    Greeting.create(:text => generate_activation_code(6), :created_at => "2023-04-10 00:00:00", :updated_at => '2023-04-10 00:00:00')
    render json: { greeting: Greeting.all.sample.text }
  end

  def generate_activation_code(size = 6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end
