package by.epam.eshop.controller;

import by.epam.eshop.command.Command;
import by.epam.eshop.controller.helper.CommandHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class Controller extends HttpServlet {

    private static final Logger LOGGER = LogManager.getRootLogger();
    private static final long serialVersionUID = 1L;
    private static final String COMMAND_NAME = "command";
    private final CommandHelper commandHelper = new CommandHelper();

    public Controller() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
        super.service(arg0, arg1);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commandName = request.getParameter(COMMAND_NAME);
        Command command = commandHelper.getCommand(commandName);
        command.execute(request, response);


    }

}
