module TrialDay
  GET_MAPPING = {}
  POST_MAPPING = {}

  def get(path, &block)
    GET_MAPPING[path] = block
  end

  def post(path, &block)
    POST_MAPPING[path] = block
  end
end
