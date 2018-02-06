package servlet;

import manager.ProjectManager;
import manager.TaskManager;
import model.Project;
import model.Task;
import util.CreateDBTables;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/homeServlet")
public class HomeServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            CreateDBTables.getInstance();
        } catch (SQLException e) {
            req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
        }
        ProjectManager projectManager = new ProjectManager();
        List<Project> projects;
        TaskManager taskManager = new TaskManager();
        List<Task> tasks;
        try {
            projects=projectManager.getAllProjects();
            tasks=taskManager.getAllTasks();
            req.setAttribute("projects",projects);
            req.setAttribute("tasks",tasks);
            req.getRequestDispatcher("WEB-INF/home.jsp").forward(req,resp);
        } catch (SQLException e) {
            req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
        }
    }
}
