module Api::V1::Lib::Macro
  class << self
    def AssignData(serializer:, type: :model, **args)
      step = lambda { |ctx, **|
        ctx[:data] = serializer.new(ctx[type], Api::V1::Lib::Macro.transform_args(ctx, args))
      }
      task = Trailblazer::Activity::TaskBuilder::Binary(step)
      { task: task, id: "data_id#{task.object_id}" }
    end

    def transform_args(ctx, args)
      args.transform_values { |value| ctx[value] }
    end
  end
end
