class GitHubClient

  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @setup_http_client.post('gists', params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end
