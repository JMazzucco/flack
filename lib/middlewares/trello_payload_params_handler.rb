class TrelloPayloadParamsHandler
  def initialize(app)
    @app = app
  end

  def call(env)
    params = env["rack.input"].gets
    if params
      result = JSON.parse(paramsf)
      if result["action"]
        result["event"] = result["action"]
        result.delete("action")
        env["action_dispatch.request.request_parameters"] = result
      end
    end
    @app.call(env)
  end
end