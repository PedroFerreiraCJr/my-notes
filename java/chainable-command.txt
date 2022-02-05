public class Main {
	public static void main(String[] args) {
	    ConditionalCommmad command = new FirstCommand();
	    do {
	        command.run();
	        if (command.successful()) {
	            command.prepareNext();
	        }
	    } while ((command = command.next()) != null);
	}
}

interface ConditionalCommmad {
    boolean successful();
    void run();
    void prepareNext();
    ConditionalCommmad next();
}

class FirstCommand implements ConditionalCommmad {
    private ConditionalCommmad next;
    
    @Override
    public boolean successful() {
        return true;
    }

    @Override
    public void run() {
        System.out.println("Command 1");
    }
    
    @Override
    public void prepareNext() {
        next = new SecondCommand();
        SecondCommand aux = (SecondCommand) next;
        aux.setValue(10);
    }
    
    @Override
    public ConditionalCommmad next() {
        return next;
    }
}

class SecondCommand implements ConditionalCommmad {
    private ConditionalCommmad next;
    private int value;
    
    @Override
    public boolean successful() {
        return true;
    }

    @Override
    public void run() {
        System.out.println("Command 2: " + value);
    }
    
    @Override
    public void prepareNext() {
        next = new ThirdCommand();
        ThirdCommand aux = (ThirdCommand) next;
        aux.setValue(100);
    }
    
    @Override
    public ConditionalCommmad next() {
        return next;
    }
    
    public void setValue(int value) {
        this.value = value;
    }
}

class ThirdCommand implements ConditionalCommmad {
    private int value;

    @Override
    public boolean successful() {
        return true;
    }

    @Override
    public void run() {
        System.out.println("Command 3: " + value);
    }
    
        @Override
    public void prepareNext() {
    }
    
    @Override
    public ConditionalCommmad next() {
        return null;
    }
    
    public void setValue(int value) {
        this.value = value;
    }
}
