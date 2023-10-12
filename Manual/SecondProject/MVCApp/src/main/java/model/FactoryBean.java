package model;

public class FactoryBean {
    private FactoryBean() {}
    private static FactoryBean factory = new FactoryBean();

    public static FactoryBean newInstance() {
        return factory;
    }

    public ICommand createInstance(String cmd) {
        if(cmd.equals("REGISTER")) {
            return new RegisterCommand();
        }
        else if(cmd.equals("CONFIRM")) {
            return new ConfirmCommand();
        }
        else if(cmd.equals("COMPLETE")) {
            return new CompleteCommand();
        }
        else {
            // 잘못된 접근에 대한 처리
            return new MainCommand();
        }
    }
}