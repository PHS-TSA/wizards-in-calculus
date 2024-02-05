import { serveDir } from "$std/http/file_server.ts";

export async function respond(req: Request, dir = "build"): Promise<Response> {
  const path = new URL(req.url).pathname;
  const res = await serveDir(req, {
    fsRoot: dir,
    enableCors: true,
  });

  res.headers.set("Cross-Origin-Opener-Policy", "same-origin");
  res.headers.set("Cross-Origin-Embedder-Policy", " require-corp");
  if (path.endsWith(".pck")) {
    res.headers.set("Content-Type", "application/octet-stream");
  }

  return res;
}

Deno.serve(async (req: Request): Promise<Response> => await respond(req));
