# encoding: utf-8
require_relative "../spec_helper"


describe LogStash::Outputs::Gelf do

  it "should register without errors" do
    plugin = LogStash::Plugin.lookup("output", "gelf").new("host" => "localhost")
    expect { plugin.register }.to_not raise_error
  end
end
