require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first) # question is stored in an array!
  end

  
  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
        *
    FROM
        questions
    WHERE 
        author_id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

   def author
    User.find_by_id(@author_id)
    end

    def replies
        Reply.find_by_question_id(@id)
    end

end

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # user is stored in an array!
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
        *
    FROM
        users
    WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) #user is stored in an array!
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_author_id(@id)
  end

end

class Question_follow
    attr_accessor :id, :question_id, :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map {|datum| Question_follow.new(datum)}
    end

    def self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            question_follows
        WHERE 
            id = ?
        SQL
        return nil unless question_follow.length > 0

        Question_follow.new(question_follow.first)
    end

    # def self.followers_for_question_id(question_id)
    #     question = Question.find_by_id(question_id)
    #     users = PlayDBConnection.instance.execute(<<-SQL, author_id)
    # end


    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

class Reply
    attr_accessor :id, :parent_id, :question_id, :author_id, :body, :subject_question
    
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum)}
    end
    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM
            replies
        WHERE
            id = ?    
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_author_id(author_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            replies
        WHERE
            author_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def initialize(options)
        @id = options['id']
        @parent_id = options['parent_id']
        @question_id = options['question_id']
        @author_id = options['author_id']
        @body = options['body']
        @subject_question = options['subject_question']
    end

    def author
        User.find_by_id(@author_id)
    end

    def question
        Question.find_by_id(@question_id)
    end

    def parent_reply
        Reply.find_by_id(@parent_id)
    end

    def child_replies
        Reply.find_by_question_id(@question_id)
    end
end

class Question_like
    attr_accessor :id, :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map {|datum| Question_like.new(datum)}
    end

    def self.find_by_id(id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_likes
        WHERE 
            id = ?
        SQL
        return nil unless question_like.length > 0
        Question_like.new(question_like.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end