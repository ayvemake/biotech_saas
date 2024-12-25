// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Import des contrôleurs
import ModalController from "./modal_controller"
import SidebarController from "./sidebar_controller"
import DropdownController from "./dropdown_controller"
import ScannerController from "./scanner_controller"
import ValidationController from "./validation_controller"

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application)

// Register controllers
application.register("modal", ModalController)
application.register("sidebar", SidebarController)
application.register("dropdown", DropdownController)
application.register("scanner", ScannerController)
application.register("validation", ValidationController)
