class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    gist = @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "Desc from TestGuru",
      files: {
        'test-guru-question1.txt' => {
          content: 'gist_content'
        }
      }
    }
  end

  def success?
    status = @client.last_response.status
    status == 200 || status == 201
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
