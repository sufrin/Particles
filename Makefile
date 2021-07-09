include         make.properties
all:            $(target.jar)
$(target.jar):  $(sources);\
                scalac -d $(target.jar) $(scalacflags) -cp $(libraries) $(sources) 

run:            $(target.jar);\
                scala -cp $(libraries):$(target.jar) Particles