package by.epam.eshop.controller.filter;

import by.epam.eshop.command.Command;
import by.epam.eshop.controller.helper.CommandHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetUserOrdersFilter implements Filter {

    private static final Logger LOGGER = LogManager.getRootLogger();
    private static final String TO_USER_ORDERS = "to-user-orders";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Command command = null;
        command = CommandHelper.getInstance().getCommand(TO_USER_ORDERS);
        command.execute((HttpServletRequest) request, (HttpServletResponse) response);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
