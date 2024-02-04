import { serveDir } from "$std/http/file_server.ts";

function serve(): void {
  Deno.serve(async (req: Request): Promise<Response> => await respond(req));
}

const headers = [
  "Cross-Origin-Opener-Policy: same-origin",
  "Cross-Origin-Embedder-Policy: require-corp",
];

export async function respond(req: Request, dir = "build"): Promise<Response> {
  return await serveDir(req, {
    fsRoot: dir,
    headers: headers,
  });
}

serve();
