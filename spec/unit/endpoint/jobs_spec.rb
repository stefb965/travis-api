require 'spec_helper'

describe Travis::Api::App::Endpoint::Jobs do
  let(:job) { Factory(:test) }
  let(:provider) { Factory(:annotation_provider) }

  it "GET /jobs/:id/annotations" do
    get("/jobs/#{job.id}/annotations", {}, "HTTP_ACCEPT" => "application/vnd.travis-ci.2+json, */*; q=0.01").should be_ok
  end

  it "POST /jobs/:id/annotations" do
    response = post("/jobs/#{job.id}/annotations", { "username" => provider.api_username, "key" => provider.api_key, "status" => "passed", "description" => "Foobar" }, "HTTP_ACCEPT" => "application/vnd.travis-ci.2+json, */*; q=0.01").should be_successful
  end
end
