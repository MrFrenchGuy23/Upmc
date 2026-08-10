@echo off
REM Upmc - optimized start script (Aikar's Flags + GC tuning)
REM Requires Java 25+ and the runnable Upmc paperclip jar in this directory.

set JAVA_OPTS=-Xms2G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dcom.mojang.eula.agree=true -Dlog4j2.isThreadContextMapInheritable=true

for %%f in (*.jar) do (
  if /I not "%%f"=="start.bat" set "JAR=%%f"
)

java %JAVA_OPTS% -jar "%JAR%" nogui
pause
