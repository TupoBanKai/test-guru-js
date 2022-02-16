class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    status = @client.last_response.status
    status == 200 || status == 201
  end

  private

  def gist_params
    {
      description: "Desc from TestGuru",
      public: true,
      files: {
        "question: {@question.body}" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:flag)
    content.join("\n")
  end

end
