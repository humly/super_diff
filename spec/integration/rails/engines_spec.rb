require "spec_helper"

RSpec.describe "Integration with Rails engines", type: :integration do
  context "when ActiveRecord is not loaded via Combustion" do
    it "does not fail to load" do
      program = make_rspec_rails_engine_program(
        "expect(true).to be(true)",
        combustion_initialize: [:action_controller],
      )

      expect(program).not_to produce_output_when_run(
        "uninitialized constant ActiveRecord",
      )
    end
  end
end
