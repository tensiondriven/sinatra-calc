# gem install --version 1.3.0 sinatra
require 'pry'
gem 'sinatra', '1.3.0'
require 'sinatra'
require 'sinatra/reloader'

get '/:operator/:num1/:num2' do
  names_to_ops = {
    'add'      => :+,
    'subtract' => :-,
    'multiply' => :*,
    'divide'   => :/,
  }

  @num1 = params[:num1].to_i
  @num2 = params[:num2].to_i
  @operator = params[:operator]

  @control1 = (1..9).map { |i| "<a href='/#{@operator}/#{@num1}/#{i}'>#{i}</a><br/>" }.join("\n")
  @control2 = (1..9).map { |i| "<a href='/#{@operator}/#{i}/#{@num2}'>#{i}</a><br/>" }.join("\n")

  @op_controls = names_to_ops.map{|key, value| "<a href='/#{key}/#{@num1}/#{@num2}'>#{value}</a><br/>"}.join("\n")

  @result = @num1.send(names_to_ops[@operator], @num2)

  erb :calc
end

get '/' do
  @result = 'Hello, World!'
  erb :calc
end

  # "#{params[:num1].to_i + params[:num2].to_i}"  <-- same as above
