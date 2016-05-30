package by.epam.eshop.command.impl;

import by.epam.eshop.command.Command;
import by.epam.eshop.entity.User;
import by.epam.eshop.service.OrderService;
import by.epam.eshop.service.exception.ServiceException;
import by.epam.eshop.service.impl.OrderServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetUserOrdersCommand implements Command {

    private static final Logger LOGGER = LogManager.getRootLogger();
    private static final String USER = "user";
    private static final String ORDERS = "orders";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        OrderService orderService = OrderServiceImpl.getInstance();
        User user = (User) request.getSession().getAttribute(USER);
        try {
            request.setAttribute(ORDERS, orderService.getOrdersByUserId(user.getId()));
        } catch (ServiceException e) {
            LOGGER.error("Error getting user orders", e);
        }
    }
}
