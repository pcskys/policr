module Policr
  commander VotingApply do
    def handle(msg, from_nav)
      chat_id = msg.chat.id

      if chat_id > 0
        bot.send_message chat_id, create_text, reply_markup: create_markup
      else
        bot.delete_message(chat_id, msg.message_id)
      end
    end

    def create_text
      t "voting.apply_quiz.start"
    end

    def create_markup
      markup = Markup.new
      markup << [Button.new(text: "开始测验", callback_data: "VotingApplyQuiz:start")]

      markup
    end
  end
end
