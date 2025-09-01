{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browsers
      "x-scheme-handler/http" = ["schizofox.desktop"];
      "x-scheme-handler/https" = ["schizofox.desktop"];
      "x-scheme-handler/chrome" = ["schizofox.desktop"]; # needs tweaking
      "text/html" = ["schizofox.desktop"];
      "application/x-extension-htm" = ["schizofox.desktop"];
      "application/x-extension-html" = ["schizofox.desktop"];
      "application/x-extension-shtml" = ["schizofox.desktop"];
      "application/xhtml+xml" = ["schizofox.desktop"];
      "application/x-extension-xhtml" = ["schizofox.desktop"];
      "application/x-extension-xht" = ["schizofox.desktop"];
      "x-scheme-handler/about" = ["schizofox.desktop"];
      "x-scheme-handler/unknown" = ["schizofox.desktop"];

      # Communication
      "x-scheme-handler/tg" = ["io.github.kukuruzka165.materialgram.desktop"];
      "x-scheme-handler/discord" = ["legcord.desktop"];
      "x-scheme-handler/tonsite" = ["io.github.kukuruzka165.materialgram.desktop"];

      # Editors
      "text/plain" = ["nvim.desktop"];
      "application/json" = ["nvim.desktop"];
      "application/x-shellscript" = ["nvim.desktop"];
      "application/x-yaml" = ["nvim.desktop"];
      "application/xml" = ["nvim.desktop"];

      # Images
      "image/png" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
      "image/svg+xml" = ["imv.desktop"];
      "image/gif" = ["imv.desktop"];

      # PDFs and documents
      "application/pdf" = ["zathura.desktop"];
      "application/epub+zip" = ["foliate.desktop"];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["abiword.desktop"]; # .docx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["gnumeric.desktop"]; # .xlsx
      "application/msword" = ["abiword.desktop"]; # .doc
      "application/vnd.ms-excel" = ["gnumeric.desktop"]; # .xls
      "application/vnd.oasis.opendocument.text" = ["abiword.desktop"]; # .odt
      "application/vnd.oasis.opendocument.spreadsheet" = ["gnumeric.desktop"]; # .ods
      "application/rtf" = ["abiword.desktop"]; # Rich Text Format
      "text/csv" = ["gnumeric.desktop"]; # CSV files

      # Archives
      "application/zip" = ["org.gnome.FileRoller.desktop"];
      "application/x-tar" = ["org.gnome.FileRoller.desktop"];
      "application/x-bzip2" = ["org.gnome.FileRoller.desktop"];
      "application/x-7z-compressed" = ["org.gnome.FileRoller.desktop"];

      # Audio and video
      "audio/mpeg" = ["mpv.desktop"];
      "audio/x-wav" = ["mpv.desktop"];
      "video/mp4" = ["mpv.desktop"];
      "video/x-matroska" = ["mpv.desktop"];
      "video/x-msvideo" = ["mpv.desktop"];

      # Code & dev
      "text/x-python" = ["nvim.desktop"];
      "text/x-csrc" = ["nvim.desktop"];
      "text/x-c++src" = ["nvim.desktop"];
      "text/x-java" = ["nvim.desktop"];
      "application/javascript" = ["nvim.desktop"];

      # Terminal emulator for opening unknown types
      "inode/directory" = ["ghostty.desktop"];
      "application/octet-stream" = ["ghostty.desktop"];
    };

    associations.added = {
      "x-scheme-handler/http" = ["schizofox.desktop"];
      "x-scheme-handler/https" = ["schizofox.desktop"];
      "x-scheme-handler/chrome" = ["schizofox.desktop"];
      "text/html" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/x-extension-htm" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/x-extension-html" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/x-extension-shtml" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/xhtml+xml" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/x-extension-xhtml" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "application/x-extension-xht" = [
        "schizofox.desktop"
        "zen-twilight.desktop"
        "userapp-Twilight-YRQP42.desktop"
        "zen-beta.desktop"
      ];
      "x-scheme-handler/tg" = [
        "io.github.kotatogram.desktop"
        "io.github.kukuruzka165.materialgram.desktop"
      ];
      "application/zip" = ["org.pwmt.zathura-cb.desktop"];
      "x-scheme-handler/tonsite" = ["io.github.kukuruzka165.materialgram.desktop"];
      "text/plain" = [
        "neovim.desktop"
        "vim.desktop"
      ];
      "image/png" = ["koko.desktop"];
    };
  };
}
