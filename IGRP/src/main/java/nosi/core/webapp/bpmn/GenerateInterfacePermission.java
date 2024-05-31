package nosi.core.webapp.bpmn;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.StringHelper;

import java.time.LocalDate;

/**
 * Emanuel
 * 28 Mar 2019
 */
public class GenerateInterfacePermission {

   public static String getGenerateClassName(String processKey) {
      if (Core.isNotNull(processKey)) {
         var formattedKey = processKey.replace("_", " ");
         formattedKey = StringHelper.camelCase(formattedKey);
         return formattedKey + "Permission";
      }
      return null;
   }

   public static String getGenerateClassContent(String dad, String processKey) {

      final var className = getGenerateClassName(processKey);
      final var email = Core.getCurrentUser().getEmail();
      final var currentDate = LocalDate.now().toString();

      return """
              package nosi.webapps.%s.process.%s;

              import nosi.core.webapp.bpmn.TaskPermissionInterface;
              import nosi.webapps.igrp.dao.ActivityExecute;

              /**
               * %s
               * %s
               */
              public class %s implements TaskPermissionInterface {

                  @Override
                  public boolean allowTask(ActivityExecute task) {
                      /**
                       * Custom implement permission
                       */
                      return true;
                  }

                  /*
                   * Example of Implementation
                   *
                   * @Override
                   * public boolean allowTask(ActivityExecute task) {
                   *     if (Core.isNotNull(task.getCustomPermission())) {
                   *         var cc = costCenter.get(Core.getCurrentUser().getEmail());
                   *         return cc != null && cc.compareTo(task.getCustomPermission()) == 0;
                   *     }
                   *     return true;
                   * }
                   *
                   * private static final Map<String, String> costCenter = new HashMap<>();
                   *
                   * static {
                   *     costCenter.put("c1@gmail.com", "c1");
                   *     costCenter.put("c2@gmail.com", "c2");
                   *     costCenter.put("c11@gmail.com", "c2");
                   * }
                   */
              }
              """.formatted(dad, processKey.toLowerCase(), email, currentDate, className);
   }


   public static String getProccessPackageName(String dad, String processKey) {
      if (Core.isNotNullMultiple(dad, processKey)) {
         return "nosi.webapps." + dad.toLowerCase() + ".process." + processKey.toLowerCase() + "." + getGenerateClassName(processKey);
      }
      return null;
   }
}
