function delete_keys(tag, timestamp, record)
  log = record
  t1 = log["event"]["kubernetes"]["labels"]
  t2 = log["event"]["kubernetes"]
  if (type(log) == 'table' and t1 ~= nil and t2 ~= nil)
  then
    local tabLabels = log["event"]["kubernetes"]["labels"]
    if not tabLabels then return end
    for key,value in pairs(tabLabels) do
      if (key == 'app' or key == 'container_image' or key == 'version')
      then
        log["event"]["kubernetes"]["labels"]["" .. key] = value
      else
        log["event"]["kubernetes"]["labels"]["" .. key] = nil
      end
    end
    log["event"]["kubernetes"]["container_hash"] = nil
    log["event"]["kubernetes"]["docker_id"] = nil
    log["event"]["kubernetes"]["pod_id"] = nil
  else
    return -1, timestamp, updated_log
  end
return 2, timestamp, log
end
