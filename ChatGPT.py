from openai import OpenAI
import time

client = OpenAI(api_key="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")

'''
my_assistant = client.beta.assistants.create(
    # instructions="You are a personal math tutor. When asked a question, write and run Python code to answer the question.",
    name="FLBOT",
    tools=[{"type": "code_interpreter"}],
    model="gpt-3.5-turbo-1106",
)
print(my_assistant)
'''

assistant_id = "asst_GZh4cRsMHYJMymLSTHkaI8lJ"

# empty_thread = client.beta.threads.create()
# print(empty_thread)

thread_id = "thread_pW6AGAkVKNUb8JKLD1tzoov4"

thread_message = client.beta.threads.messages.create(
  thread_id,
  role="user",
  content="제 이름이 뭐라고 그랬죠?",
)
print(thread_message)

run = client.beta.threads.runs.create(
  thread_id=thread_id,
  assistant_id=assistant_id
)
print(run)

run_id = run.id

while True:
    run = client.beta.threads.runs.retrieve(
      thread_id=thread_id,
      run_id=run_id
    )
    if run.status == "completed":
        break
    else:
        time.sleep(2)
    # print(run)

thread_messages = client.beta.threads.messages.list(thread_id)
print(thread_messages.data[0].content[0].text.value)
























