package com.meongx.pw.logwatcher.watcher

import scala.actors.Actor
import java.io.{RandomAccessFile, File}

class BaseWatcher(logfile:String) extends Actor {
  def act = {
    val file = new File(logfile)
    val reader = new RandomAccessFile(file, "r")

    reader.seek(file.length())
    loop {
      Option(reader.readLine()) match {
        case Some(line) => processLine(line)
        case None => Thread.sleep(250)
      }
    }
  }

  def processLine(line:String) = println(line)
}
