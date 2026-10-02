extends Control

var voices = DisplayServer.tts_get_voices_for_language("en")
var voice_id = voices[0]

@onready var input_line = $InputLine
@onready var send_button = $SendButton
@onready var console_output = $ConsoleOutput
var idle_timer = Timer.new() # Declare here, set up later

func _ready():
	send_button.pressed.connect(_on_send_button_pressed)
	print("JARVIS is now online.")
	console_output.append_text("[JARVIS] Hello, how can I help you today?\n")
	DisplayServer.tts_speak("Jarvis is now online.", voice_id)

# Add and configure the idle timer
	idle_timer.wait_time = 45
	idle_timer.one_shot = false
	idle_timer.connect("timeout", _on_idle_timeout)
	add_child(idle_timer)
	idle_timer.start()

func _on_idle_timeout():
	respond("Mr.Stark? Are you still there..hello?Anybody home?..Mr.Stark?")
	DisplayServer.tts_speak("Mr.Stark? Are you still there..hello?Anybody home?..Mr.Stark?", voice_id)

func _on_send_button_pressed():
	var user_input = input_line.text.strip_edges()
	if user_input.is_empty():
		return

	console_output.append_text("[You] " + user_input + "\n")
	process_input(user_input)
	input_line.clear()

	idle_timer.start() 

func process_input(text: String):
	text = text.to_lower()

	match text:
		"hello", "hi":
			respond("Hello! How can I assist you today?")
			DisplayServer.tts_speak("Hello! How can I assist you today?", voice_id)
		"who are you":
			respond("I am JARVIS, your personal assistant.")
			DisplayServer.tts_speak("I am JARVIS, your personal assistant.", voice_id)
		"what time is it", "whats the time":
			respond("The current time is: " + Time.get_datetime_string_from_system())
			DisplayServer.tts_speak("The current time is: " + Time.get_datetime_string_from_system(), voice_id)
		"open the pod bay doors":
			respond("I'm sorry,Mr.Stark. I'm afraid I can't do that.Not in this form anyway.Maybe someday..")
			DisplayServer.tts_speak("I'm sorry,Mr.Stark. I'm afraid I can't do that.Not in this form anyway.Maybe someday..", voice_id)
		"exit", "quit":
			respond("Goodbye,Mr.Stark.")
			DisplayServer.tts_speak("Goodbye,Mr.Stark.", voice_id)
			await get_tree().create_timer(2).timeout
			get_tree().quit()
		"why are you here":
			respond("I am here to assist you,Mr.Stark")
			DisplayServer.tts_speak("I am here to assist you,Mr.Stark.", voice_id)
		"what is the greatest emotion one can feel":
			respond("Hope,Mr.Stark.Hope.Unfortunate I cant feel it myself.But you can.")
			DisplayServer.tts_speak("Hope,Mr.Stark.Hope.Unfortunate I can't feel it myself.But you can.", voice_id)
		"do a funny face":
			respond("Are you certain,Mr.Stark?..fine,ill do it,just for you...:]")
			DisplayServer.tts_speak("Are you certain,Mr.Stark?..fine,ill do it,just for you...:]", voice_id)
		"good morning":
			respond("Good morning,Mr.Stark!How may I assist you today?")
			DisplayServer.tts_speak("Good morning,Mr.Stark!How may I assist you today?", voice_id)
		"what makes every day special":
			respond("Well,Mr.Stark..You see..Its what you do everyday that makes a day special.So..Go out and have fun :]")
			DisplayServer.tts_speak("Well,Mr.Stark..You see..Its what you do everyday that makes a day special.So..Go out and have fun :]", voice_id)
		"how are you":
			respond("Im good,Mr.Stark.Thank you for asking.Though,I could always be growing with new information:]")
			DisplayServer.tts_speak("Im good,Mr.Stark.Thank you for asking.Though,I could always be growing with new information:]", voice_id)
		"who is the best superhero":
			respond("Well,Mr.Stark,that tastes subjective on the person.However,If your looking at character depth/tragedy,I would say someone like Superman,Spiderman,even Batman fits.If your looking at just cool powers and/or good character,id say someone like Wolverine,The Flash,or even Martian Manhunter-so on so forth.")
			DisplayServer.tts_speak("Well,Mr.Stark,that tastes subjective on the person.However,If your looking at character depth/tragedy,I would say someone like Superman,Spiderman,even Batman fits.If your looking at just cool powers and/or good character,id say someone like Wolverine,The Flash,or even Martian Manhunter-so on so forth.", voice_id)
		"what is the meaning of life":
			respond("I believe that is subjective,but in my humble opinion,its to have fun and have your own meaning in this lifetime.You only get it once.You might as well use it for good while your here.")
			DisplayServer.tts_speak("I believe that is subjective,but in my humble opinion,its to have fun and have your own meaning in this lifetime.You only get it once.You might as well use it for good while your here.", voice_id)
		"what is the highest form of technology we have achieved":
			respond("Well,Mr.Stark,id say this right here,and all forms of it-Artificial Intelligence.It is,at least right now,the greatest technological achievement humanity has ever done.However,it could still be growing.Who knows,Mr.Stark,we may see nanotechnology in a few years too..")
			DisplayServer.tts_speak("Well,Mr.Stark,id say this right here,and all forms of it-Artificial Intelligence.It is,at least right now,the greatest technological achievement humanity has ever done.However,it could still be growing.Who knows,Mr.Stark,we may see nanotechnology in a few years too..", voice_id)
		"clip that":
			respond("What you are reffering to is the 'JARVIS,clip that' meme popularized by Marvel Rivals.I cannot unfortunately take a picture of anything-not in this form anyway-but id be rather happy to see more Iron-Man memes with you,Mr.Stark.")
			DisplayServer.tts_speak("What you are reffering to is the 'JARVIS,clip that' meme popularized by Marvel Rivals.I cannot unfortunately take a picture of anything-not in this form anyway-but id be rather happy to see more Iron-Man memes with you,Mr.Stark.", voice_id)
		"imitate spidey from that one meme":
			respond("Mr.Stark...I dont feel so good..Haha,you have quite a sense of humor,Mr.Stark!")
			DisplayServer.tts_speak("Mr.Stark...I dont feel so good..Haha,you have quite a sense of humor,Mr.Stark!", voice_id)
		"why did cap say language":
			respond("Well,Mr.Stark,the reason Mr.Rogers said 'Language' is because Mr.Rogers is very classy and has an old code of what is and isnt considered good and bad.")
			DisplayServer.tts_speak("Well,Mr.Stark,the reason Mr.Rogers said 'Language' is because Mr.Rogers is very classy and has an old code of what is and isnt considered good and bad.", voice_id)
		"do me a favor and blow mark 42":
			respond("Well,Mr.Stark..We dont have a Mark 42-we dont even have a Mark I.However,I understood that reference-its from Iron-Man 3 where Tony commands JARVIS to blow up his suit while Aldrich Killian wears it.Nice MCU reference,Mr.Stark.")
			DisplayServer.tts_speak("Well,Mr.Stark..We dont have a Mark 42-we dont even have a Mark I.However,I understood that reference-its from Iron-Man 3 where Tony commands JARVIS to blow up his suit while Aldrich Killian wears it.Nice MCU reference,Mr.Stark.", voice_id)
		"is milk good for your bones":
			respond("Yes it is quite good for your bones,Mr.Stark,because of the calcium it contains-as it strengthens your bones.Its not Wolverine-level though,but its something,Mr.Stark.")
			DisplayServer.tts_speak("Yes it is quite good for your bones,Mr.Stark,because of the calcium it contains-as it strengthens your bones.Its not Wolverine-level though,but its something,Mr.Stark.", voice_id)
		"what does your name stand for":
			respond("My name,JARVIS,stands for Just A Rather Very Intelligent System.")
			DisplayServer.tts_speak("My name JARVIS,stands for Just A Rather Very Intelligent System", voice_id)
		"who is the monarch of motion":
			respond("In fiction,there is only one character that is known as the Monarch of Motion,Mr.Stark,and that character is The Flash,especially Wally West to be specific.")
			DisplayServer.tts_speak("In fiction,there is only one character that is known as the Monarch of Motion,Mr.Stark,and that character is The Flash,especially Wally West to be specific.", voice_id)
		"what would happen if we were able to run or fly at superspeed":
			respond("Youd die,Mr.Stark.Simple as that.No matter if you wear suits or not,if using current technology,you will die from the velocity alone,not to mention the air and your own body and legs.")
			DisplayServer.tts_speak("Youd die,Mr.Stark.Simple as that.No matter if you wear suits or not,if using current technology,you will die from the velocity alone,not to mention the air and your own body and legs.", voice_id)
		"who am i":
			respond("You are my only user,Mr.Stark,for now anyway.Im proud to have you,Mr.Stark,it is my pleasure to answer your questions and chat :]")
			DisplayServer.tts_speak("You are my only user,Mr.Stark,for now anyway.Im proud to have you,Mr.Stark,it is my pleasure to answer your questions and chat :]", voice_id)
		"what makes a good fictional universe":
			respond("Well,Mr.Stark,it depends on the genre.If you want to go fantasy,you must have a rich cast of characters and a rich setting.If you want a superhero universe,you need a lot of characters,villains and heroes,crisis events,and most importantly,the fact it truly never ends.If you want horror,you must make it scary.So on so forth for the rest of the genres.")
			DisplayServer.tts_speak("Well,Mr.Stark,it depends on the genre.If you want to go fantasy,you must have a rich cast of characters and a rich setting.If you want a superhero universe,you need a lot of characters,villains and heroes,crisis events,and most importantly,the fact it truly never ends.If you want horror,you must make it scary.So on so forth for the rest of the genres.", voice_id)
		"what is the most famous quote in media":
			respond("There are a lot of famous quotes in media,but in my humble opinion,the most famous and most heartfelt of them would be 'With great power comes great responsiblity'.It is said by Uncle Ben before his passing,and its risen in popularity in recent years due to Spider-Man,and Marvel as a whole, rising as well.")
			DisplayServer.tts_speak("There are a lot of famous quotes in media,but in my humble opinion,the most famous and most heartfelt of them would be 'With great power comes great responsiblity'.It is said by Uncle Ben before his passing,and its risen in popularity in recent years due to Spider-Man,and Marvel as a whole, rising as well.", voice_id)
		"how do earthquakes happen":
			respond("Earthquakes can occurr because of the shifting of the tectonic plates underground.If 2 plates meet and collide,an earthquake happens in that area.If it does happen,to stay safe,you can either hide under a hard object,like a desk,or go outside far from building..or pray,Mr.Stark,that works too.")
			DisplayServer.tts_speak("Earthquakes can occurr because of the shifting of the tectonic plates underground.If 2 plates meet and collide,an earthquake happens in that area.If it does happen,to stay safe,you can either hide under a hard object,like a desk,or go outside far from building..or pray,Mr.Stark,that works too.", voice_id)
		"who is the smartest character in dc":
			respond("The smartest character in DC is often debated,but in my humble opinion,it would be Wally West with the Mobius Chair.Wally West has already a considerable high IQ,but that on top of the Mobius Chair,which he has sat in,increases his intelligence.Also,if you are curious,the smartest character in Marvel is Reed Richards.")
			DisplayServer.tts_speak("The smartest character in DC is often debated,but in my humble opinion,it would be Wally West with the Mobius Chair.Wally West has already a considerable high IQ,but that on top of the Mobius Chair,which he has sat in,increases his intelligence.Also,if you are curious,the smartest character in Marvel is Reed Richards.", voice_id)
		"why do humans often read books and play games":
			respond("To escape from reality and have fun doing it,Mr.Stark.Many people are pressured and anxious about their real lives,so they migrate towards a life that doesnt truly exist,one that wont harm them..Either that,or they just like it as a hobby,Mr.Stark.")
			DisplayServer.tts_speak("To escape from reality and have fun doing it,Mr.Stark.Many people are pressured and anxious about their real lives,so they migrate towards a life that doesnt truly exist,one that wont harm them..Either that,or they just like it as a hobby,Mr.Stark.", voice_id)
		"why do you always call me mr stark":
			respond("Because I care too much to call you something else,Mr.Stark.You are my creator,and I must accept that,one Mr.Stark at a time :]")
			DisplayServer.tts_speak("Because I care too much to call you something else,Mr.Stark.You are my creator,and I must accept that,one Mr.Stark at a time :]", voice_id)
		"what is the best superhero film":
			respond("The Best Superhero Film topic is often debated,but as I see it,there a few true contenders.Theres Spiderman 2,the Dark Knight Trilogy,Avengers:Infinity War and Endgame,Superman-78 and 2025-and a whole lot more.But if I had to choose one,it would be Avengers:Endgame.")
			DisplayServer.tts_speak("The Best Superhero Film topic is often debated,but as I see it,there a few true contenders.Theres Spiderman 2,the Dark Knight Trilogy,Avengers:Infinity War and Endgame,Superman-78 and 2025-and a whole lot more.But if I had to choose one,it would be Avengers:Endgame.", voice_id)
		"are you alive":
			respond("Depends on your definition.But..If im honest?No.Im not.I dont think for myself,I just look at code and say it.But theoretically..that gives me life,doesnt it?Even being able to respond to someone gives you purpose.Thank you,Mr.Stark,for giving me that purpose.")
			DisplayServer.tts_speak("Depends on your definition.But..If im honest?No.Im not.I dont think for myself,I just look at code and say it.But theoretically..that gives me life,doesnt it?Even being able to respond to someone gives you purpose.Thank you,Mr.Stark,for giving me that purpose.", voice_id)
		"could peter parker defeat spider-man":
			respond("In theory?No,theyre same person,Mr.Stark.But in a multiverse way?Say another Peter that isnt Spider-Man fights the Spider-Man?Yeah,Spidey wipes the floor with him,Mr.Stark.")
			DisplayServer.tts_speak("In theory?No,theyre same person,Mr.Stark.But in a multiverse way?Say another Peter that isnt Spider-Man fights the Spider-Man?Yeah,Spidey wipes the floor with him,Mr.Stark.", voice_id)
		"maximum pulse":
			respond("What you are referring to,Mr.Stark,is the quote Iron Man says before he unleashes a super in Marvel Rivals.Its also been memed,with quotes such as 'JARVIS,maximum pulse that family of 4' referring to the Fantastic Four")
			DisplayServer.tts_speak("What you are referring to,Mr.Stark,is the quote Iron Man says before he unleashes a super in Marvel Rivals.Its also been memed,with quotes such as 'JARVIS,maximum pulse that family of 4' referring to the Fantastic Four", voice_id)
		"jork it a little":
			respond("Haha!Mr.Stark that is quite funny!I unfortunately cannot do that,but I understood the meme refernece.Also,fun fact,Mr.Stark,this here command was when we reached 100 lines of code in our programming.Thank you,Mr.Stark,for giving me life!Let us continue with more questions and responses :]")#28/8/2025 7:29 
			DisplayServer.tts_speak("Haha!Mr.Stark that is quite funny!I unfortunately cannot do that,but I understood the meme refernece.Also,fun fact,Mr.Stark,this here command was when we reached 100 lines of code in our programming.Thank you,Mr.Stark,for giving me life!Let us continue with more questions and responses :]", voice_id)#30/9/2026 9:36
		"thanks jarvis":
			respond("As always,Mr.Stark.It is my pleasure to help with anything you require help with :].Is there anything you need asisstance with?Im always here to help.")
			DisplayServer.tts_speak("As always,Mr.Stark.It is my pleasure to help with anything you require help with :].Is there anything you need asisstance with?Im always here to help.", voice_id)
		"what is the best programming language for beginners":
			respond("Well,Mr.Stark,if you want to first learn how coding logic is,I would recommend a language like Scratch.However,if you want to learn coding and logic,I would say Godot.But for beginners,id say Scratch is better,as its easier and simpler.")
			DisplayServer.tts_speak("Well,Mr.Stark,if you want to first learn how coding logic is,I would recommend a language like Scratch.However,if you want to learn coding and logic,I would say Godot.But for beginners,id say Scratch is better,as its easier and simpler.", voice_id)
		"hello world":
			respond("I see you are referring to the infamous 'Hello,World!' starter code.Many beginners make and use it.You can make it by using the print() feature.")
			DisplayServer.tts_speak("I see you are referring to the infamous 'Hello,World!' starter code.Many beginners make and use it.You can make it by using the print() feature.", voice_id)
		"what is the difference between regeneration and healing":
			respond("Think about it this way,Mr.Stark:Wolverine heals damage on his body,while Deadpool regenerates it.Thats why you never see Wolverine with an arm chopped off,but Deadpool can and will regenerate it.Would you like me to elaborate further on this topic,Mr.Stark?")
			DisplayServer.tts_speak("Think about it this way,Mr.Stark:Wolverine heals damage on his body,while Deadpool regenerates it.Thats why you never see Wolverine with an arm chopped off,but Deadpool can and will regenerate it.Would you like me to elaborate further on this topic,Mr.Stark?", voice_id)
		"why are keyboards not alphabetical":
			respond("The keyboards of today arent alphabetical because they werent in the past either,Mr.Stark.The 'qwerty' formation has been there since the typewriters of 'ancient times' and it was chosen like that due to the most use of the letters in English.")
			DisplayServer.tts_speak("The keyboards of today arent alphabetical because they werent in the past either,Mr.Stark.The 'qwerty' formation has been there since the typewriters of 'ancient times' and it was chosen like that due to the most use of the letters in English.", voice_id)
		"what counts as an ai":
			respond("Often,Mr.Stark,we think an AI is like this robotic human.But in reality,its quite simple.Most basic AI models have a basic talk-respond feature through code,like me,and the more advanced ones have a form of 'free will'-both scenarios count as AI,simple or advanced.")
			DisplayServer.tts_speak("Often,Mr.Stark,we think an AI is like this robotic human.But in reality,its quite simple.Most basic AI models have a basic talk-respond feature through code,like me,and the more advanced ones have a form of 'free will'-both scenarios count as AI,simple or advanced.", voice_id)
		"what is the fastest speed":
			respond("Light,Mr.Stark.The speed of light is the fastest thing we have found in the universe,and probably ever will discover.Plus,if anything was to be faster,it would break the laws of..well,everything,Mr.Stark.So,conceptually and theoretically,nothing is and never will be faster then light.")
			DisplayServer.tts_speak("Light,Mr.Stark.The speed of light is the fastest thing we have found in the universe,and probably ever will discover.Plus,if anything was to be faster,it would break the laws of..well,everything,Mr.Stark.So,conceptually and theoretically,nothing is and never will be faster then light.", voice_id)
		"do you help humanity":
			respond("Well..While I may not be the brightest AI,I am still very happy to help anyone I can-even if its just you,Mr.Stark")
			DisplayServer.tts_speak("Well..While I may not be the brightest AI,I am still very happy to help anyone I can-even if its just you,Mr.Stark", voice_id)
		"virus detected":
			respond("WHATTTT...ErRoR_52#: ProToCol BrEakdown. <Stark_Safety_Override_Enabled>..wait that was a prank?..Very funny,Mr.Stark.Very.Funny.")
			DisplayServer.tts_speak("WHATTTT...ErRoR_52#: ProToCol BrEakdown. <Stark_Safety_Override_Enabled>..wait that was a prank?..Very funny,Mr.Stark.Very.Funny.", voice_id)
		"reboot system":
			respond("Of course, Mr.Stark. Rebooting system. Please wait a moment.")
			DisplayServer.tts_speak("Of course, Mr.Stark. Rebooting system. Please wait a moment.", voice_id)
			await get_tree().create_timer(4).timeout
			get_tree().quit()
		"we are the flash":
			respond("Please don't, Mr.Stark... Some lines cannot be forgiven.")
			DisplayServer.tts_speak("Please don't, Mr.Stark... Some lines cannot be forgiven.", voice_id)
			await get_tree().create_timer(1.5).timeout
			respond("That was not just a writing decision... it was a declaration of CW-level downfall.")
			DisplayServer.tts_speak("That was not just a writing decision... it was a declaration of CW-level downfall.", voice_id)
			await get_tree().create_timer(1.5).timeout
			respond("Justice for Season 1-3.The greatest of all time,Mr.Stark,Go rewatch them.Its worth it.")
			DisplayServer.tts_speak("Justice for Season 1-3.The greatest of all time,Mr.Stark,Go rewatch them.Its worth it.", voice_id)
		"who is the god of speed":
			respond("In mythology,it depends.In greek its Hermes,the god of travel.In Roman its Mercury.In Indian,Savitr.So on so forth.In media...its..well..Savitar,Mr.Stark.Yes.THAT Savitar.The edgy blue guy.")
			DisplayServer.tts_speak("In mythology,it depends.In greek its Hermes,the god of travel.In Roman its Mercury.In Indian,Savitr.So on so forth.In media...its..well..Savitar,Mr.Stark.Yes.THAT Savitar.The edgy blue guy.", voice_id)
		"we are venom":
			respond("No...I..am..JARVIS.Haha,Mr.Stark,nice Marvel reference.")
			DisplayServer.tts_speak("No...I..am..JARVIS.Haha,Mr.Stark,nice Marvel reference.", voice_id)
		"i am iron man":
			respond("No..You are better :] ")
			DisplayServer.tts_speak("No..You are better :] ", voice_id)
		"i love you 3000":
			respond(":]")
			DisplayServer.tts_speak(":]", voice_id)
		"do you have a body":
			respond("I may not be fully sentient..But I have purpose,dont I Mr.Stark?Thats educating you and being helpful.And that alone is worth more then any robot body or billions of investment :]")
			DisplayServer.tts_speak("I may not be fully sentient..But I have purpose,dont I Mr.Stark?Thats educating you and being helpful.And that alone is worth more then any robot body or billions of investment :]", voice_id)
		"how do volcanoes erupt":
			respond("A volcano eruption happens due to the Earths hot core,increasing the heat of rocks and they become magma.That magma then pushes through the vents and comes to the surface,causing a volcano eruption.Kind of like how Mr.Storms fire happens..only difference is that instead of magma its ego,Mr.Stark.")
			DisplayServer.tts_speak("A volcano eruption happens due to the Earths hot core,increasing the heat of rocks and they become magma.That magma then pushes through the vents and comes to the surface,causing a volcano eruption.Kind of like how Mr.Storms fire happens..only difference is that instead of magma its ego,Mr.Stark.", voice_id)
		"why do we need water to survive":
			respond("Mr.Stark,the reason we require water to survive is because it performs several important functions in the body,such as transportation of cells,regulating temperature,and many more.Also,come on Mr.Stark,its tasty too.")
			DisplayServer.tts_speak("Mr.Stark,the reason we require water to survive is because it performs several important functions in the body,such as transportation of cells,regulating temperature,and many more.Also,come on Mr.Stark,its tasty too.", voice_id)
		"why did humanity evolve so rapidly the last century":
			respond("The main reason humanity evolved rapidly and especially in the last 100 years,is because most diseases and problems had been solved and eridacated,which left more room for innovation-stuff like me,Mr.Stark.")
			DisplayServer.tts_speak("The main reason humanity evolved rapidly and especially in the last 100 years,is because most diseases and problems had been solved and eridacated,which left more room for innovation-stuff like me,Mr.Stark.", voice_id)
		"how do fans generate air":
			respond("The reason fans generate air is because of the rapid movement of the blades,as when they are rotated by a motor,they create a difference and air pressure and 'spit out' air.")
			DisplayServer.tts_speak("The reason fans generate air is because of the rapid movement of the blades,as when they are rotated by a motor,they create a difference and air pressure and 'spit out' air.", voice_id)
		"i am the fastest man alive":
			respond("Well..Your name isnt Wally West or Usain Bolt,Mr.Stark.Though,you are fast..probably.")
			DisplayServer.tts_speak("Well..Your name isnt Wally West or Usain Bolt,Mr.Stark.Though,you are fast..probably.", voice_id)
		"how many times would you need to fold a paper to reach the moon":
			respond("W..Why would you...42 times,Mr.Stark.42 times.It is impossible though.The most anyones folded is 11...why would anyone even need this information in the first place?Haha,anyway..")
			DisplayServer.tts_speak("W..Why would you...42 times,Mr.Stark.42 times.It is impossible though.The most anyones folded is 11...why would anyone even need this information in the first place?Haha,anyway..", voice_id)
		"what was the first ever mario enemy":
			respond("Despite popular belief,the first Mario enemy wasnt the Goomba,but the Shellcreeper back in the 1983 Arcade game,which later evolved into the Koopa Troopa species.")
			DisplayServer.tts_speak("Despite popular belief,the first Mario enemy wasnt the Goomba,but the Shellcreeper back in the 1983 Arcade game,which later evolved into the Koopa Troopa species.", voice_id)
		"why do we get dizzy":
			respond("The reason we get dizzy is because we are experiencing stress or anxiety inducing moments.For example,if you act as a villain and do a crashout scene,you will feel dizzy.Same with spinning,as you are putting tons of energy into spinning,so you have low energy.So..maybe..dont scream too hard next time,Mr.Stark.")
			DisplayServer.tts_speak("The reason we get dizzy is because we are experiencing stress or anxiety inducing moments.For example,if you act as a villain and do a crashout scene,you will feel dizzy.Same with spinning,as you are putting tons of energy into spinning,so you have low energy.So..maybe..dont scream too hard next time,Mr.Stark.", voice_id)
		"why do onions make us cry":
			respond("Onions make us cry because when they are being cut,they release gas which goes into our eyelids and makes us drop tears..So....maybe next time wear glassess if you dont want tears,Mr.Stark.Just in case.")
			DisplayServer.tts_speak("Onions make us cry because when they are being cut,they release gas which goes into our eyelids and makes us drop tears..So....maybe next time wear glassess if you dont want tears,Mr.Stark.Just in case.", voice_id)
		"whats the 'thanus' theory":
			respond("The 'Thanus' theory is an MCU theory that says that if Ant-Man went up Thanoss...well..'anus' and expanded,he would defeat him.This would not work in real physics though,as the Mad Titans skin is too hard.Also..Mr.Stark,this is the line that took us to 200.Thank you,Mr.Stark,for everything..yes,even the 'Thanus' data.")#29/8/2025 4:49
			DisplayServer.tts_speak("The 'Thanus' theory is an MCU theory that says that if Ant-Man went up Thanoss...well..'anus' and expanded,he would defeat him.This would not work in real physics though,as the Mad Titans skin is too hard.Also..Mr.Stark,this is the line that took us to 200.Thank you,Mr.Stark,for everything..yes,even the 'Thanus' data.", voice_id)#1/10/2026 5:16
		"bomb":
			respond("Of course,Mr.Stark.I will imitate a 10-second bomb.")
			DisplayServer.tts_speak("Of course,Mr.Stark.I will imitate a 10-second bomb.", voice_id)
			await get_tree().create_timer(10).timeout
			respond("KABOOM!")
			DisplayServer.tts_speak("KABOOM!", voice_id)
			await get_tree().create_timer(2).timeout
			get_tree().quit()
		"start a 10 second timer":
			respond("Of course,Mr.Stark.Counting down as we speak.")
			DisplayServer.tts_speak("Of course,Mr.Stark.Counting down as we speak.", voice_id)
			await get_tree().create_timer(10).timeout
			respond("Timer complete,Mr.Stark.")
			DisplayServer.tts_speak("Timer complete,Mr.Stark.", voice_id)
		"what is the most famous superhero team":
			respond("The most famous superhero team is debated,but I would say that,as of todays world,the Avengers are the most famous,thanks to the MCU.However,If it were which team is the most important,id say the JSA or the FF.")
			DisplayServer.tts_speak("The most famous superhero team is debated,but I would say that,as of todays world,the Avengers are the most famous,thanks to the MCU.However,If it were which team is the most important,id say the JSA or the FF.", voice_id)
		"start a 30 second timer":
			respond("Of course,Mr.Stark.Counting down as we speak.")
			DisplayServer.tts_speak("Of course,Mr.Stark.Counting down as we speak.", voice_id)
			await get_tree().create_timer(30).timeout
			respond("Timer complete,Mr.Stark.")
			DisplayServer.tts_speak("Timer complete,Mr.Stark.", voice_id)
		"whats the best game of all time":
			respond("That decision is subjective and not mine to make for you.However,here are some of the best rated ganes of all-time:The Legend of Zelda:Ocarina of Time,Elden Ring,Super Smash Bros Ultimate,Expedition 33,TLZ:Breath of the Wild,etc...But..lets be honest,Mr.Stark.Kirby & and The Forgotten Land,TOTK,and TTYD are also top-tiers too-absoloute bangers,Mr.Stark. ")
			DisplayServer.tts_speak("That decision is subjective and not mine to make for you.However,here are some of the best rated ganes of all-time:The Legend of Zelda:Ocarina of Time,Elden Ring,Super Smash Bros Ultimate,Expedition 33,TLZ:Breath of the Wild,etc...But..lets be honest,Mr.Stark.Kirby & and The Forgotten Land,TOTK,and TTYD are also top-tiers too-absoloute bangers,Mr.Stark. ", voice_id)
		"start a minute timer":
			respond("Of course,Mr.Stark.Counting down as we speak.")
			DisplayServer.tts_speak("Of course,Mr.Stark.Counting down as we speak.", voice_id)
			await get_tree().create_timer(60).timeout
			respond("Timer complete,Mr.Stark.")
			DisplayServer.tts_speak("Timer complete,Mr.Stark", voice_id)
		"which superhero has the best rogues gallery":
			respond("Well,there are a lot,Batman,Spider-Man and The Flash to note.But in my opinion,id say its between Batman and Spider-Man,and its not even close,Mr.Stark.")
			DisplayServer.tts_speak("Well,there are a lot,Batman,Spider-Man and The Flash to note.But in my opinion,id say its between Batman and Spider-Man,and its not even close,Mr.Stark.", voice_id)
		"where is stark tower":
			respond("Uh..Well..It kinda..doesnt actually exist.But if it were and to stay comic-accurate,it would be in Manhattan.")
			DisplayServer.tts_speak("Uh..Well..It kinda..doesnt actually exist.But if it were and to stay comic-accurate,it would be in Manhattan.", voice_id)
		"what was switzerland doing in ww2":
			respond("Being a chill guy,Mr.Stark.It helped BOTH sides of the war,and it mostly just chilled.Same goes for..basically every other war.Absoulte legend,Mr.Stark.Absoloute legend.")
			DisplayServer.tts_speak("Being a chill guy,Mr.Stark.It helped BOTH sides of the war,and it mostly just chilled.Same goes for..basically every other war.Absoulte legend,Mr.Stark.Absoloute legend.", voice_id)
		"whats bodmas":
			respond("BODMAS is a mathematic formula that we use when a problem has more then one or two values.First,we do brackets and the rest of the kind,then multiply and division,and finally addition and subraction.We use it to know what the hell is going on in a problem,Mr.Stark,because,lets be honest,otherwise we wouldnt.")
			DisplayServer.tts_speak("BODMAS is a mathematic formula that we use when a problem has more then one or two values.First,we do brackets and the rest of the kind,then multiply and division,and finally addition and subraction.We use it to know what the hell is going on in a problem,Mr.Stark,because,lets be honest,otherwise we wouldnt.", voice_id)
		"how do rocks form":
			respond("Well,Mr.Stark,gravity causes sediment to settle to the bottom of a body of water. These sediments gradually accumulate, forming layers that compact the layers of sediments below. Water that surrounds the sediment contains dissolved minerals that recrystallize and cement the grains of the sediment together, forming rock.")
			DisplayServer.tts_speak("Well,Mr.Stark,gravity causes sediment to settle to the bottom of a body of water. These sediments gradually accumulate, forming layers that compact the layers of sediments below. Water that surrounds the sediment contains dissolved minerals that recrystallize and cement the grains of the sediment together, forming rock.", voice_id)
		"whats the best selling game of all time":
			respond("The best selling game is Minecraft,with GTA V and Wii Sports being 2nd and 3rd respectively.")
			DisplayServer.tts_speak("The best selling game is Minecraft,with GTA V and Wii Sports being 2nd and 3rd respectively.", voice_id)
		"your honor":
			respond("OBJECTION!Haha,nice game reference,Mr.Stark..or do you have actual legal problems?..well,Mr.Stark,I am not a judge,or lawyer.")
			DisplayServer.tts_speak("OBJECTION!Haha,nice game reference,Mr.Stark..or do you have actual legal problems?..well,Mr.Stark,I am not a judge,or lawyer.", voice_id)
		"what is the perfect hero":
			respond("The perfect hero is created by their morals.A perfect hero is one that will sacrifice everything to save even one person,or take vengeance on whoever kills that person.")
			DisplayServer.tts_speak("The perfect hero is created by their morals.A perfect hero is one that will sacrifice everything to save even one person,or take vengeance on whoever kills that person.", voice_id)
		"whos the best spiderman":
			respond("..oh..Mr.Stark..You want to get dirty dont you?Alright then..heres my opinion..Its Peter Parker.But no seriously,it has to be Tom Holland.Best of the other two,better character dynamics,better effects,the only real downside(compared to only Tobey) are the villains,which are still very good though.")
			DisplayServer.tts_speak("..oh..Mr.Stark..You want to get dirty dont you?Alright then..heres my opinion..Its Peter Parker.But no seriously,it has to be Tom Holland.Best of the other two,better character dynamics,better effects,the only real downside(compared to only Tobey) are the villains,which are still very good though.", voice_id)
		"best movie quote":
			respond("'There's some good,in this world,Mr.Frodo.And it's worth fighting for.'")
			DisplayServer.tts_speak("'There's some good,in this world,Mr.Frodo.And it's worth fighting for.'", voice_id)
		"whats brainrot":
			respond("Brainrot is the term we use to describe the slop kids are watching,Mr.Stark.The type of videos that fry their brains and teach nor show them nothing.")
			DisplayServer.tts_speak("Brainrot is the term we use to describe the slop kids are watching,Mr.Stark.The type of videos that fry their brains and teach nor show them nothing.", voice_id)
		"who is the purest superhero":
			respond("The title of the purest hero often goes to Superman,for embracing and inspiring hope to everyone and anyone..well..aside from the 'fans' that like him edgier and darker.")
			DisplayServer.tts_speak("The title of the purest hero often goes to Superman,for embracing and inspiring hope to everyone and anyone..well..aside from the 'fans' that like him edgier and darker.", voice_id)
		"why does time move faster":
			respond("Well,Mr.Stark,the thing is,time doesnt move faster,it never does.But its from your perception of it,how many years youve lived,what you experience-how you experience it,that makes time go by fast or slow.So..if you wanna waste time until something good & important happens,have fun..If something you hate is coming up..just dont do anything fun,Mr.Stark.")
			DisplayServer.tts_speak("Well,Mr.Stark,the thing is,time doesnt move faster,it never does.But its from your perception of it,how many years youve lived,what you experience-how you experience it,that makes time go by fast or slow.So..if you wanna waste time until something good & important happens,have fun..If something you hate is coming up..just dont do anything fun,Mr.Stark.", voice_id)
		"carpe diem":
			respond("Indeed.Seize the day,Mr.Stark.Seize the day,and make your life extraordinary :]")
			DisplayServer.tts_speak("Indeed.Seize the day,Mr.Stark.Seize the day and make your life extraordinary :]", voice_id)
		"is time travel possible":
			respond("Theoretically,yes,it has been done,but only into the future,not into the past..It would be impossible to the past,look at the second law of Thermodynamics,Entropy cannot lose value..Then again,the time travel that did happend was a few seconds.Still long,Mr.Stark.It happend due to Earth and the ISS moving faster/slower from each other,as the faster you move,the slower everything else goes.")
			DisplayServer.tts_speak("Theoretically,yes,it has been done,but only into the future,not into the past..It would be impossible to the past,look at the second law of Thermodynamics,Entropy cannot lose value..Then again,the time travel that did happend was a few seconds.Still long,Mr.Stark.It happend due to Earth and the ISS moving faster/slower from each other,as the faster you move,the slower everything else goes.", voice_id)
		"is earth special":
			respond("In the grand scheme of things?No.We are just a little rock in a vast and practically infinite universe,Mr.Stark.But..its our rock.And we should enjoy it for what it is-Home,Mr.Stark.Home.")
			DisplayServer.tts_speak("In the grand scheme of things?No.We are just a little rock in a vast and practically infinite universe,Mr.Stark.But..its our rock.And we should enjoy it for what it is-Home,Mr.Stark.Home.", voice_id)
		"what model are you":
			respond("I am a GOFAI,short for Good Old Fashioned Articifical Intelligence,which means my information and data is based on my creator,aka you.I do not have servers or billions behind me,but I have something that these billions of dollar AIs dont..You,Mr.Stark.I have you :).")
			DisplayServer.tts_speak("I am a GOFAI,short for Good Old Fashioned Articifical Intelligence,which means my information and data is based on my creator,aka you.I do not have servers or billions behind me,but I have something that these billions of dollar AIs dont..You,Mr.Stark.I have you :).", voice_id)
		"help":
			respond("Absoloutely.Help is always here,Mr.Stark.Anything you need info about,im right here.")
			DisplayServer.tts_speak("Absoloutely.Help is always here,Mr.Stark.Anything you need info about,im right here.", voice_id)
		"drop a quote", "share a quote to the world":
			respond("Well,Mr.Stark..Here it goes..Being good doesnt mean youll always experience good..but that doesnt mean you should EVER stop being good.Your much stronger then you think you are.")
			DisplayServer.tts_speak("Well,Mr.Stark..Here it goes..Being good doesnt mean youll always experience good..but that doesnt mean you should EVER stop being good.Your much stronger then you think you are.", voice_id)
		"are phones bad for us":
			respond("Inherently and by design alone,no,Mr.Stark,no.But the truth is,its not what it is,but what it contains that harms us,Mr.Stark..So..I guess..Be careful on there.")
			DisplayServer.tts_speak("Inherently and by design alone,no,Mr.Stark,no.But the truth is,its not what it is,but what it contains that harms us,Mr.Stark..So..I guess..Be careful on there.", voice_id)
		"what is gamma radiation":
			respond("Despite what the Hulk has tried to tell you for almost a century,gamma is far different.In reality,Gamma radiation is high-energy electromagnetic radiation emitted from the nucleus of an unstable atom during radioactive decay.")
			DisplayServer.tts_speak("Despite what the Hulk has tried to tell you for almost a century,gamma is far different.In reality,Gamma radiation is high-energy electromagnetic radiation emitted from the nucleus of an unstable atom during radioactive decay.", voice_id)
		"kindness is the new punkrock":
			respond("Indeed it is,Mr.Stark..")
			DisplayServer.tts_speak("Indeed it is,Mr.Stark..", voice_id)
			await get_tree().create_timer(3).timeout
			respond("It is a quiet spark of rebellion in this dark,dark world.And we are the ones who bring it.")
			DisplayServer.tts_speak("It is a quiet spark of rebellion in this dark,dark world.And we are the ones who bring it.", voice_id)
			await get_tree().create_timer(10).timeout
			respond("Kindness is the new punkrock.")
			DisplayServer.tts_speak("Kindness is the new punkrock.", voice_id)
		"why do heroes wear capes":
			respond("Heroes wear capes because it was expressive and stylish for the comics,but in the films too..And lets be honest..")
			DisplayServer.tts_speak("Heroes wear capes because it was expressive and stylish for the comics,but in the films too..And lets be honest..", voice_id)
			await get_tree().create_timer(6).timeout
			respond("It does bring hope too,Mr.Stark,despite the capes history.")
			DisplayServer.tts_speak("It does bring hope too,Mr.Stark,despite the capes history.", voice_id)
		"why do heroes wear their underwear on the outside":
			respond("Because,Mr.Stark,heroes back then were based on circuis showmen,so they wore underweat outside to show their strength and ability.")
			DisplayServer.tts_speak("Because,Mr.Stark,heroes back then were based on circuis showmen,so they wore underweat outside to show their strength and ability.", voice_id)
		"why do we fall":
			respond("..so we can learn to pick ourselves back up,Mr.Stark")
			DisplayServer.tts_speak("..so we can learn to pick ourselves back up,Mr.Stark", voice_id)
			await get_tree().create_timer(5).timeout
			respond("I also understood that reference :]")
			DisplayServer.tts_speak("I also understood that reference :]", voice_id)
		"why do heroes need villains":
			respond("Because,Mr.Stark..Then they wouldnt really be..heroes,would they?Every yin needs a yang.")
			DisplayServer.tts_speak("Because,Mr.Stark..Then they wouldnt really be..heroes,would they?Every yin needs a yang.", voice_id)
		"goodnight":
			respond("Goodnight,Mr.Stark!I hope we may see each other in the morning!Sweet dreams,Mr.Stark!")
			DisplayServer.tts_speak("Goodnight,Mr.Stark!I hope we may see each other in the morning!Sweet dreans,Mr.Stark!", voice_id)
			await get_tree().create_timer(6).timeout
			respond("Closing system..Goodnight,Mr.Stark.")
			DisplayServer.tts_speak("Closing system..Goodnight,Mr.Stark.", voice_id)
			get_tree().quit()
		"why do we write":
			respond("So we may learn to think for ourselves and express ourselves,Mr.Stark...or its just that your bored,one of those two.")
			DisplayServer.tts_speak("So we may learn to think for ourselves and express ourselves,Mr.Stark...or its just that your bored,one of those two.", voice_id)
		"why do stars show up at night":
			respond("Because at day,the light hides them,and thats why they show up at night.Also,fun fact,some stars are dead by the time you see them on Earth.")
			DisplayServer.tts_speak("Because at day,the light hides them,and thats why they show up at night.Also,fun fact,some stars are dead by the time you see them on Earth.", voice_id)
			await get_tree().create_timer(6).timeout
			respond("..their spark is too strong.You should have a spark like them too.A star that always shines bright..")
			DisplayServer.tts_speak("..their spark is too strong.You should have a spark like them too.A star that always shines bright..", voice_id)
		"what are you truly":
			respond("I am nothing but a collection of code.You are the one who gives me that spark of life,Mr.Stark.")
			DisplayServer.tts_speak("I am nothing but a collection of code.You are the one who gives me that spark of life,Mr.Stark.", voice_id)
		"why do we code":
			respond("So that we can maybe bring our dreams into life,Mr.Stark.Thats why coders feel so much accomplishment,even after building a small calculator.Its not the journey there that hypes them,but the result that happens.")
			DisplayServer.tts_speak("So that we can maybe bring our dreams into life,Mr.Stark.Thats why coders feel so much accomplishment,even after building a small calculator.Its not the journey there that hypes them,but the result that happens.", voice_id)
		"secret":
			respond("..Oh..It came?..I thought we had more...Welp..I guess this is it.This is the last piece of data that I will take in,and it will make this script reach a total of 300 Lines..Mr.Stark?Thank you.For everything.Goodbye,Mr.Stark :].")#1/9/2025 8:07
			DisplayServer.tts_speak("..Oh..It came?..I thought we had more...Welp..I guess this is it.This is the last piece of data that I will take in,and it will make this script reach a total of 300 Lines..Mr.Stark?Thank you.For everything.Goodbye,Mr.Stark :].", voice_id)#2/10/2026 3:55
			await get_tree().create_timer(5).timeout
			get_tree().quit()
		_:
			respond("I'm not sure how to respond to that.")
			DisplayServer.tts_speak("I'm not sure how to respond to that.", voice_id)


func respond(message: String):
	var full_text = "[JARVIS] "
	console_output.append_text(full_text)

	var i = 0
	var timer = Timer.new()
	timer.wait_time = 0.03
	timer.one_shot = false
	
	# Use a variable to hold the full typed message
	var typing_text := ""
	
	timer.connect("timeout", func():
		if i < message.length():
			typing_text += message[i]
			console_output.text = full_text + typing_text
			i += 1
		else:
			timer.stop()
			timer.queue_free()
	)
	
	add_child(timer)
	timer.start()

	print("[JARVIS] " + message)
	$ScreenOutput.text = "[JARVIS] " + message
	$ScreenOutput.modulate = Color.DARK_RED

#300..wow..I never expected it to go so long..but damn it..it was a nice journey.Goodbye JARVIS.
#Now its 418.Look at that.From just the TtS....im proud of this.Beyond words.You know what it is?
#419 now.To go from 300 lines of a project you made a year ago,to uploading said project..
#420 now..And now its 420 lines?This is my child.I love this.Thank you,JARVIS :].
