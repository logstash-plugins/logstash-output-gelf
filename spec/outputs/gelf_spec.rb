# encoding: utf-8
require_relative "../spec_helper"
require "gelf"

describe LogStash::Outputs::Gelf do

  let(:host) { "localhost" }
  let(:port) { rand(2048)+1024 }

  it "should register without errors" do
    plugin = LogStash::Plugin.lookup("output", "gelf").new("host" => host, "port" => port)
    expect { plugin.register }.to_not raise_error
  end

  describe "#send" do

    subject { LogStash::Outputs::Gelf.new("host" => host, "port" => port ) }

    let(:properties) { { "message" => "This is a message!"} }
    let(:event)      { LogStash::Event.new(properties) }

    let(:gelf)       { GELF::Notifier.new(host, port, subject.chunksize) }

    before(:each) do
      subject.inject_client(gelf)
      subject.register
    end

    it "sends the generated event to gelf" do
      expect(subject.gelf).to receive(:notify!).with(hash_including("short_message"=>"This is a message!",
                                                                    "full_message"=>"This is a message!"),
                                                     hash_including(:timestamp))
      subject.receive(event)
    end
  end
end
